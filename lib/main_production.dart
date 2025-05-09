import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/appConstants.dart';
import 'config/localization/localization.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'domain/models/notificationModel/notificationModel.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  OneSignal.initialize("9158013e-362c-4f0b-ae4b-576b4f1f670c");
  OneSignal.Notifications.requestPermission(true);

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug
  );

  await SharedPreferencesHelper.init();
  await Supabase.initialize(
    url: "https://pjwaryjtumnzyjruiyzz.supabase.co",
    anonKey:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqd2FyeWp0dW1uenlqcnVpeXp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ3NDk4NjAsImV4cCI6MjA2MDMyNTg2MH0.kea1W9JUgeGhgIZI6FYGYiTlltQafjVA6TlD7khjzDk",
  );
  final langCode = await SharedPreferencesHelper.getData('lang_code') ?? 'en';

  runApp(
    EasyLocalization(
        assetLoader: CodegenLoader(),
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        startLocale: Locale(langCode),
        child: const MyApp()),
  );



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
            (route) => route.isFirst,
        // يحتفظ فقط بأول شاشة (الشاشة الأخيرة قبل الإشعار)
      );
    });
    return ChangeNotifierProvider(
        create: (_) => LanguageProvider()..loadSavedLanguage(),
        child: Consumer<LanguageProvider>(builder: (context, langProvider, _) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: langProvider.locale,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: (settings) => Routes.onGenerate(settings),
          );
        }));
  }
}

