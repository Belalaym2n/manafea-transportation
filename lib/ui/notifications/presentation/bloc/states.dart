import 'package:manafea/ui/notifications/domain/entities/notificationEntity.dart';

import '../../../../domain/models/notificationModel/notificationModel.dart';

abstract class NotificationsStates {}

class NotificationsInitial extends NotificationsStates {}

class NotificationsLoading extends NotificationsStates {}

class NotificationsSuccess extends NotificationsStates {
  final List<NotificationsEntity> notifications;
  NotificationsSuccess(this.notifications);
}

class NotificationsError extends NotificationsStates {
  final String message;
  NotificationsError(this.message);
}

class NotificationDetailsOpened extends NotificationsStates {
  final NotificationModel notification;
  NotificationDetailsOpened(this.notification);
}
