import '../../../../config/error_handling/errorHandling.dart';
import '../../../../domain/models/notificationModel/notificationModel.dart';
import '../entities/notificationEntity.dart';

abstract class NotificationRepo {
  Future<Result<List<NotificationsEntity>>> fetchNotification();

}