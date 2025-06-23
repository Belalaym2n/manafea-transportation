import 'package:manafea/domain/models/notificationModel/notificationModel.dart';

abstract class NotificationsEvents{}
class NotificationsTabTapped extends NotificationsEvents {}
class NotificationViewDetailsPressed  extends NotificationsEvents {
  NotificationModel notificationModel;
  NotificationViewDetailsPressed(this.notificationModel);
}

