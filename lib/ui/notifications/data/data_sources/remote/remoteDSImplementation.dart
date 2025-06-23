import 'package:dio/dio.dart';
import 'package:manafea/config/ApiManager/apiManager.dart';
import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/domain/models/notificationModel/notificationModel.dart';
import 'package:manafea/ui/notifications/data/data_sources/remote/remoteDS.dart';
import 'package:manafea/ui/notifications/data/models/NotificationsModels.dart';

import '../../../domain/entities/notificationEntity.dart';

class NotificationRemoteDSImp implements NotificationRemoteDS {
  ApiManager apiManager;

  NotificationRemoteDSImp(this.apiManager);

  @override
  Future<Result<List<NotificationsModel>>> fetchNotification() async {
    try {
      print("succe");
      Response response = await apiManager.getNotification();

      print("respons ${response.data}");

      final List<dynamic> notificationsJson = response.data['notifications'];

      final List<NotificationsModel> notifications = notificationsJson
          .map((json) => NotificationsModel.fromJson(json))
          .toList();

      return Result.success(notifications); //
    } catch (e) {
      print(e.toString());
      return Result.failure(e.toString());
    }
  }

}
