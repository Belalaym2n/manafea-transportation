import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/activity/view/activityScreen.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
import 'package:manafea/ui/auth/view/withEmail/forgetPassword.dart';
import 'package:manafea/ui/auth/view/withEmail/verifyScreen.dart';
import 'package:manafea/ui/bottomNav/view/bottomNav.dart';
import 'package:manafea/ui/splashScreen/view/adminSplashScreen.dart';

 import 'package:manafea/ui/splashScreen/view/splashScreen%5D.dart';

import '../ui/auth/view/autoLogin.dart';
import '../ui/auth/view/loginAdmin/autoLoginAdmin.dart';
import '../ui/auth/view/loginAdmin/signInWithEmail.dart';
import '../ui/auth/view/withPhone/loginScreen.dart';
import '../ui/auth/view/withEmail/signIn.dart';
import '../ui/auth/view/withEmail/signUpWithEmail.dart';
import '../ui/bottomNav/view/bottomNavAdmin.dart';
import '../ui/carBooking/view/cars_screen.dart';
import '../ui/getOrders/getOrdersForUser/view/userOrders.dart';
import '../ui/hotels/hotels/view/filterHotels.dart';
 import '../ui/onBoard/view/onBoardScreen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String adminSplashScreen = "sdfsdwet/";
  static const String adminLogin = "login/";
  static const String addActivity = "xcv/";
  static const String signUp = "signUp/";
  static const String onBoard = "/sfsdf";
  static const String orders = "sfsffdf";
  static const String login = "sdf/";
  static const String autoLogin = "lasdassadogin/";
  static const String autoLoginAdmin = "sdfdsfdsfsd/";
  static const String verifyScreen = "verify";
  static const String homeScreen = "home";
  static const String bottomNav = "5784/";
  static const String bottomNavAdmin = "bottomNavAdmin/";
  static const String personDetailed = "err";
  static const String hotels = "hotel";
  static const String verifyEmail = "/sdf";
  static const String carsScreen = "carscreen";
  static const String carBooking = "carbookin";
  static const String activityBooking = "acrivity";
  static const String filterHotels = "hotels";
  static const String signInScreen = "signin";
  static const String forgetPassword = "forgetPassword";
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.autoLoginAdmin:
      return MaterialPageRoute(
        builder: (context) =>  const AutoLoginAdmin(),
      );

      case AppRoutes.bottomNavAdmin:
        return MaterialPageRoute(
          builder: (context) =>  const BottomNavAdmin(),
        );
      case AppRoutes.adminLogin:
        return MaterialPageRoute(
          builder: (context) =>   SingInAdmin(),
        );
      case AppRoutes.onBoard:
        return MaterialPageRoute(
          builder: (context) =>   OnBoardScreen(),
        );
      case AppRoutes.adminSplashScreen:
        return MaterialPageRoute(
          builder: (context) =>   const AdminSplashScreen(),
        );

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );


      case AppRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (context) =>   SignInScreen(),
        );
      case AppRoutes.verifyEmail:
        return MaterialPageRoute(
          builder: (context) => const VerifyEmailScreen(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case AppRoutes.orders:
        return
        MaterialPageRoute(
          builder: (context) => const UserOrders(),
        );
      case AppRoutes.filterHotels:
        return MaterialPageRoute(
          builder: (context) => const FilterHotels(),
        );

      case AppRoutes.autoLogin:
        return MaterialPageRoute(
          builder: (context) => const AutoLogin(),
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
