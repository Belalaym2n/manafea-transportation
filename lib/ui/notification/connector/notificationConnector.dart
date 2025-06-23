import 'package:manafea/config/base_class.dart';

import '../../../domain/models/notificationModel/notificationModel.dart';

abstract class NotificationConnector extends BaseConnector{
  @override
  onError(String message) {
    
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }

  showNotification(List<NotificationModel>notification);
  emptyData();
}