import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/appConstants.dart';
import 'config/localization/localization.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'data/services/notifcationService/notificationService.dart';
import 'domain/models/notificationModel/notificationModel.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  OneSignal.initialize(AppConstants.oneSignalAPPID);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug);
  await GetStorage.init();

  await SharedPreferencesHelper.init();
  await Supabase.initialize(
      url: AppConstants.supabaseUrl, anonKey: AppConstants.supabaseAnounKey);
  final langCode = await SharedPreferencesHelper.getData('lang_code') ?? 'en';
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
          assetLoader: const CodegenLoader(),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            Locale('ur'),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          startLocale: Locale(langCode),
          child: const MyApp())));

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
    GetNotificationService.openNotification();

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
