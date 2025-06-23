import 'package:manafea/config/error_handling/errorHandling.dart';

import 'package:manafea/domain/models/notificationModel/notificationModel.dart';
import 'package:manafea/ui/notifications/data/data_sources/remote/remoteDS.dart';
import 'package:manafea/ui/notifications/data/models/NotificationsModels.dart';

import '../../domain/entities/notificationEntity.dart';
import '../../domain/repositories/notificationRepo.dart';

class NotificationRepoImp implements NotificationRepo {
  final NotificationRemoteDS remoteDataSource;

  NotificationRepoImp(this.remoteDataSource);

  @override
  Future<Result<List<NotificationsEntity>>> fetchNotification() async {
    // TODO: implement fetchNotification

    try {
      final result = await remoteDataSource.fetchNotification();

      if (result.isSuccess) {
         final notifications = result.data?.map((model) {
          return NotificationsEntity.fromJson(model.toJson()); // تحويل الـ Model إلى Entity
        }).toList() ?? [];

        return Result.success(notifications)     ;
      } else {
        return Result.failure(result.error);
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
