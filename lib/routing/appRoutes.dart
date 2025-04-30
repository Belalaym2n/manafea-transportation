import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/activity/view/activityScreen.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
import 'package:manafea/ui/bottomNav/view/bottomNav.dart';
import 'package:manafea/ui/carBooking/view/car_bookin_screen.dart';
import 'package:manafea/ui/home/view/homeScreen.dart';
import 'package:manafea/ui/hotels/hotels/widgets/filterHotelsItem/filterHotelsItem.dart';
import 'package:manafea/ui/login/view/autoLogin.dart';
import 'package:manafea/ui/login/view/loginScreen.dart';
import 'package:manafea/ui/login/widgets/userPersonalDetails.dart';
import 'package:manafea/ui/login/widgets/verifyScreen.dart';
import 'package:manafea/ui/onBoard/view/onBoardingScreen.dart';
import 'package:manafea/ui/splashScreen/view/splashScreen%5D.dart';

import '../ui/bottomNav/view/bottomNavAdmin.dart';
import '../ui/carBooking/view/cars_screen.dart';
import '../ui/hotels/hotels/view/filterHotels.dart';

class AppRoutes {
  static const String splash = "/";
  static const String addActivity = "xcv/";
  static const String onBoard = "/sfsdf";
  static const String login = "login/";
  static const String autoLogin = "login/";
  static const String verifyScreen = "verify";
  static const String homeScreen = "home";
  static const String bottomNav = "5784/";
  static const String bottomNavAdmin = "sfsf/";
  static const String personDetailed = "err";
  static const String hotels = "hotel";
  static const String carsScreen = "carscreen";
  static const String carBooking = "carbookin";
  static const String activityBooking = "acrivity";
  static const String filterHotels = "hotels";
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.onBoard:
        return MaterialPageRoute(
          builder: (context) => const Onboardingscreen(),
        );

      case AppRoutes.filterHotels:
        return MaterialPageRoute(
          builder: (context) => const FilterHotels(),
        );
      case AppRoutes.autoLogin:
        return MaterialPageRoute(
          builder: (context) => const AutoLogin(),
        );
      case AppRoutes.bottomNavAdmin:
        return MaterialPageRoute(
          builder: (context) => const BottomNavAdmin(),
        );


      case AppRoutes.addActivity:
        return MaterialPageRoute(
          builder: (context) => const AddActivity(),
        );

      case AppRoutes.carsScreen:
        return MaterialPageRoute(
          builder: (context) => const CarsScreen(),
        );


      case AppRoutes.activityBooking:
        return MaterialPageRoute(
          builder: (context) => const ActivityScreen(),
        );






      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );


      case AppRoutes.bottomNav:
        return MaterialPageRoute(
          builder: (context) => const BottomNav(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
