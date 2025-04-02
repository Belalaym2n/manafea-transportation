import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/home/view/homeScreen.dart';
import 'package:manafea/ui/hotelBooking/viewModel/hottelBookingViewModel.dart';
import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'config/appConstants.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'domain/models/notificationModel.dart';
import 'firebase_options.dart';
void customLogHandler(String message, {String? name, int level = 0}) {
  if (!message.contains('BLASTBufferQueue')) {
    developer.log(message, name: name ?? 'FlutterApp', level: level);
  }
}

void main() async {

  debugPrint = (String? message, {int? wrapWidth}) {
    if (message?.contains("BLASTBufferQueue") == true) return;
    debugPrintSynchronously(message, wrapWidth: wrapWidth);
  };

  WidgetsFlutterBinding.ensureInitialized();
  print("object");
  OneSignal.initialize("9158013e-362c-4f0b-ae4b-576b4f1f670c");
  OneSignal.Notifications.requestPermission(true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

  await SharedPreferencesHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);

    OneSignal.Notifications.addClickListener((event) {
      final notification = event.notification;
      NotificationModel notifications = NotificationModel(
          date: DateTime.now().toString(),
          time: DateTime.now().toString(),
          description: notification.body.toString(),
          id: notification.notificationId,
          title: notification.title.toString(),
          imageUrl: notification.bigPicture.toString());
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => NotificationDetailedItem(
            notificationModel: notifications,
          ),
        ),
            (route) =>
        route.isFirst, // يحتفظ فقط بأول شاشة (الشاشة الأخيرة قبل الإشعار)
      );
    });
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
    );
  }
}
