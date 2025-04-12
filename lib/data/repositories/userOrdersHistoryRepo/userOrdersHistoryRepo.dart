import 'dart:ffi';

import 'package:manafea/data/services/userHistoryOrderDatabaseService/userOrdersHistoryServic.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class UserOrderHistoryFirebaseRepo {
  final UserOrderHistoryFirebaseService _userOrderHistoryService;
  UserOrderHistoryFirebaseRepo(this._userOrderHistoryService);

  Future<List<BaseOrder>> getAllOrders() async {
    try {
      return await _userOrderHistoryService.getAllOrders();
    } catch (e) {
      throw Exception("Failed to fetch orders: $e");
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      return await _userOrderHistoryService.deleteOrder(id);
    } catch (E) {
      throw Exception("Something went wrong ${E.toString()}");
    }
  }
}
