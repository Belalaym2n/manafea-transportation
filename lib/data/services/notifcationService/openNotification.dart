import 'package:flutter/material.dart';
import 'package:manafea/ui/home/view/homeScreenItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../domain/models/notificationModel/notificationModel.dart';
import '../../../ui/home/view/homeScreen.dart';

class OpenNotification {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static openNotification() {
    return OneSignal.Notifications.addClickListener((event) {
      print("object");
      final notification = event.notification;
      NotificationModel notifications = NotificationModel(
          date: DateTime.now().toString(),
          time: DateTime.now().toString(),
          description: notification.body.toString(),
          id: notification.notificationId,
          title: notification.title.toString(),
          imageUrl: notification.bigPicture.toString());
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>   HomeScreenItem()),
        (route) =>
            route.isFirst, // يحتفظ فقط بأول شاشة (الشاشة الأخيرة قبل الإشعار)
      );
    });
  }
}
