import 'package:manafea/data/services/userHistoryOrderDatabaseService/userOrdersHistoryServic.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class UserOrderHistoryRepo {
  final UserOrderHistoryService _userOrderHistoryService;
  UserOrderHistoryRepo(this._userOrderHistoryService);

  Future<List<BaseOrder>> getOrders() async {
    try {
      return await _userOrderHistoryService.getOrders();
    } catch (e) {
      throw Exception("Failed to fetch orders: $e");
    }
  }
}
