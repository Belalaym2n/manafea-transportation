import 'package:manafea/domain/models/notificationModel/notificationModel.dart';

import '../../../../../config/error_handling/errorHandling.dart';
import '../../models/NotificationsModels.dart';

abstract class NotificationRemoteDS{
  Future<Result<List<NotificationsModel>>> fetchNotification();
}