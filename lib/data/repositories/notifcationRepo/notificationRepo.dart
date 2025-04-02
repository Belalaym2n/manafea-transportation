import '../../../domain/models/notificationModel.dart';
import '../../services/notifcationService/notificationService.dart';

class NotificationRepository {
  final GetNotificationService _service;

  NotificationRepository(this._service);

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      return await _service.fetchNotifications();
    } catch (error) {
      throw Exception();
    }
  }
}
