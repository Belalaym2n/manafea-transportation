import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';
import 'package:manafea/domain/models/requestOrderModel.dart';
import 'package:manafea/ui/userOrders/widgets/orderItem.dart';
import '../../../data/repositories/userOrdersHistoryRepo/userOrdersHistoryRepo.dart';
import '../../../domain/models/hotelModels/requestHotelBooking.dart';
import '../connector/getUserOrderConnector.dart';
import '../widgets/widgetsChangedInOrderItem/buildActivityWidget.dart';
import '../widgets/widgetsChangedInOrderItem/buildHotelBookingOrderDetailec.dart';
import '../widgets/userOrdersScreenItem.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class GetUserOrdersViewModel extends BaseViewModel<GetUserOrderConnector> {
  final UserOrderHistoryFirebaseRepo userOrderHistoryRepo;
  List<BaseOrder> allOrders = []; // لتخزين جميع الأوردرات
  List<BaseOrder> filterOrders = [];
  String _selectedStatus = 'Pending';
  bool _isLoading = false;
  bool _deleteOrderLoading = false;
  String? errorMessage;

  String get selectedStatus => _selectedStatus;

  bool get isLoading => _isLoading;

  bool get deleteOrderLoading => _deleteOrderLoading;

  GetUserOrdersViewModel(this.userOrderHistoryRepo);

  Future<void> getOrders() async {
    try {
      setLoading(true);
      errorMessage = null;
      notifyListeners();
      allOrders = await userOrderHistoryRepo.getAllOrders();
      filterOrdersByStatus(_selectedStatus);

    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setLoading(false);
    }
  }

  void filterOrdersByStatus(String status) {
    _selectedStatus = status;
    filterOrders = allOrders.where((order) => order.status == status).toList();
    notifyListeners();
  }

  void changeStatus(String status) {
    _selectedStatus = status;
    filterOrdersByStatus(status);
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  deleteOrder(String id) async {
    try {
      _deleteOrderLoading = true;
      notifyListeners();
      await userOrderHistoryRepo.deleteOrder(id);
      filterOrders.removeWhere((order) => order.id == id);
      allOrders.removeWhere((order) => order.id == id);

      _deleteOrderLoading = false;
      notifyListeners();
    } catch (e) {
      _deleteOrderLoading = false;
      notifyListeners();

      return connector!.onError(e.toString());
    }
  }

  Widget showOrder(Animation<Offset> animation) {
    if (filterOrders.isEmpty) {
      return const Expanded(
        child: Center(child: Text("No Orders Found")),
      );
    }

    return Expanded(
      child: SlideTransition(
        position: animation,
        child: ListView.builder(
          itemCount: filterOrders.length,
          itemBuilder: (context, index) {
            var order = filterOrders[index];

            if (order is RequestHotelBooking) {
              return OrderItem(
                orderType: 'Hotel Name',
                orderName: 'hote',
                cancelOrder: deleteOrder,
                order: order,
                orderDetailedChanged:
                buildHotelBookingOrder(order: order),
              );
            }
            if (order is RequestActivityOrderModel) {
              return OrderItem(
                orderName: order.activityName.toString(),
                orderType: "Activity name",
                cancelOrder: deleteOrder,
                order: order,
                orderDetailedChanged:
                orderActivityWidget(
                  order: order
                ),
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }

}
