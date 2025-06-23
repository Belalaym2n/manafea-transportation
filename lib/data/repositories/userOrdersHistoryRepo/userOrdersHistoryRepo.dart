
import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/data/services/userHistoryOrderDatabaseService/userOrdersHistoryServic.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class UserOrderHistoryFirebaseRepo {
  final UserOrderHistoryFirebaseService _userOrderHistoryService;
  UserOrderHistoryFirebaseRepo(this._userOrderHistoryService);

  Future<Result<List<BaseOrder>>> getAllOrders() async {

      return await _userOrderHistoryService.getAllOrders();

  }

  Future<void> deleteOrder(String id) async {
    try {
      return await _userOrderHistoryService.deleteOrder(id);
    } catch (E) {
      throw Exception("Something went wrong ${E.toString()}");
    }
  }
}
