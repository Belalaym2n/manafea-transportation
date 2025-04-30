
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/home/view/homeScreen.dart';
 import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as developer;

import 'config/appConstants.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'domain/models/notificationModel/notificationModel.dart';
import 'firebase_options.dart';


void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  print("object");
  OneSignal.initialize("9158013e-362c-4f0b-ae4b-576b4f1f670c");
  OneSignal.Notifications.requestPermission(true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

  await SharedPreferencesHelper.init();
  await Supabase.initialize(
    url:"https://pjwaryjtumnzyjruiyzz.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqd2FyeWp0dW1uenlqcnVpeXp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ3NDk4NjAsImV4cCI6MjA2MDMyNTg2MH0.kea1W9JUgeGhgIZI6FYGYiTlltQafjVA6TlD7khjzDk",
  );
  runApp(const MyApp());

  // runApp(
  //     DevicePreview(
  //         enabled: true,
  //         tools: const [
  //           ...DevicePreview.defaultTools,
  //         ],
  //         builder: (context) => const MyApp()));
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
        route.isFirst,
        // يحتفظ فقط بأول شاشة (الشاشة الأخيرة قبل الإشعار)
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
