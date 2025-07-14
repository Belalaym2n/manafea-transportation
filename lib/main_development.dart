import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manafea/data/services/notifcationService/notificationService.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as developer;

import 'config/appConstants.dart';
import 'config/localization/localization.dart';
import 'data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';

import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  OneSignal.initialize(AppConstants.oneSignalAPPID);
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug);

  await SharedPreferencesHelper.init();
  await Supabase.initialize(
      url: AppConstants.supabaseUrl, anonKey: AppConstants.supabaseAnounKey);
  final langCode = await SharedPreferencesHelper.getData('lang_code') ?? 'en';

  runApp(EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('ur'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(langCode),
      child:   MyApp(
        flavor: "development",
      )));
}

