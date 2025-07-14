import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:provider/provider.dart';

import 'config/appConfigeratin/appConfigeration.dart';
import 'config/appConstants.dart';
import 'config/localization/localization.dart';
import 'data/services/notifcationService/notificationService.dart';

class MyApp extends StatelessWidget {
  String flavor;
    MyApp({super.key,required this.flavor});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    AppConfiguration.flavor = flavor;
    AppConstants.initSize(context);

    GetNotificationService.openNotification();

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
