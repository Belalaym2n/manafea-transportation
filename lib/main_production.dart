import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'config/appConstants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://f98968bded543a720197a8d0e76ef160@o4508100777082880.ingest.us.sentry.io/4508972885737472';
      // Adds request headers and IP for users,
      // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: const MyApp(),
      ),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("object");
    AppConstants.initSize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
    );
  }
}
