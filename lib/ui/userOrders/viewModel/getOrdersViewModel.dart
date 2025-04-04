import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/userOrders/widgets/orderItem.dart';
import '../../../data/repositories/userOrdersHistoryRepo/userOrdersHistoryRepo.dart';
import '../connector/getUserOrderConnector.dart';
import '../widgets/userOrdersScreenItem.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class GetUserOrdersViewModel extends BaseViewModel<GetUserOrderConnector> {
  final UserOrderHistoryRepo userOrderHistoryRepo;
  List<BaseOrder> userOrders = [];

  GetUserOrdersViewModel(this.userOrderHistoryRepo);

  Future<void> getOrders() async {

    try {
      userOrders = await userOrderHistoryRepo.getOrders();
      notifyListeners();
    } catch (e) {
      connector?.onError(e.toString());
    }
  }

  Widget showOrder() {
    return FutureBuilder<List<BaseOrder>>(
      future: getOrders().then((_) => userOrders), // حل لمشكلة `Future<void>`
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return connector!.showLoading();
        }

        if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return connector!.onError(snapshot.error.toString());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No Orders Found"));
        }
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var order =snapshot.data![index];
               print("object ${order}");
              return OrderItem(order:order );
            },
          ),
        );
      },
    );
  }
}
