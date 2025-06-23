import 'package:manafea/data/services/getOrdersForAdmin/getOrdersForAdminService.dart';
import '../../../config/error_handling/errorHandling.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';

class AdminOrdersHistoryFirebaseRepo {
  final GetOrdersForAdminService _usersOrdersHistoryService;

  AdminOrdersHistoryFirebaseRepo(this._usersOrdersHistoryService);

  Stream<Result> getAllOrdersStream({required String date}) {
    return _usersOrdersHistoryService.getAllOrdersStream(date: date);
  }

  Future<Result> updateOrderStatus(
      {required String id, required String status}) async {
    return  await _usersOrdersHistoryService.updateOrderStatus(status: status, id: id);
  }
}
