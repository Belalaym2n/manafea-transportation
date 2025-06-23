
import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/domain/models/notificationModel/notificationModel.dart';
import 'package:manafea/ui/notifications/domain/entities/notificationEntity.dart';
import 'package:manafea/ui/notifications/domain/repositories/notificationRepo.dart';

class FetchNotificationsUseCase {
  final NotificationRepo repository;

  FetchNotificationsUseCase(this.repository);

  Future<Result<List<NotificationsEntity>>> call() async {
    return await repository.fetchNotification();
  }
}
