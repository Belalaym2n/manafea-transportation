import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import '../../../../data/repositories/getOrderForAdmin/getOrdersForAdminRepo.dart';
import '../../../../data/repositories/userOrdersHistoryRepo/userOrdersHistoryRepo.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../connector/getUserOrderConnector.dart';

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
    setLoading(true);

    final result = await userOrderHistoryRepo.getAllOrders();
    if (result.isSuccess) {
      allOrders = result.data!;
      filterOrdersByStatus(_selectedStatus);
      notifyListeners();
    } else {
      setLoading(false);

      connector!.onError(result.error.toString());
    }
    setLoading(false);
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
      return connector!.emptyOrders();
    }

    return Expanded(
        child: SlideTransition(
            position: animation, child: connector!.showOrders(filterOrders)));
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

}
