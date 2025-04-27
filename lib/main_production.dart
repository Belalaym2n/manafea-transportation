import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/appConstants.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'domain/models/notificationModel/notificationModel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   OneSignal.initialize("9158013e-362c-4f0b-ae4b-576b4f1f670c");
  OneSignal.Notifications.requestPermission(true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

  await SharedPreferencesHelper.init();

  runApp(const MyApp());

  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = 'https://f98968bded543a720197a8d0e76ef160@o4508100777082880.ingest.us.sentry.io/4508972885737472';
  //     // Adds request headers and IP for users,
  //     // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
  //     options.sendDefaultPii = true;
  //   },
  //   appRunner: () => runApp(
  //     SentryWidget(
  //       child: const MyApp(),
  //     ),
  //   ),
  // );

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

