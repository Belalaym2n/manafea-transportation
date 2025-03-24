import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/bottomNav/view/bottomNav.dart';
import 'package:manafea/ui/carBooking/view/car_bookin_screen.dart';
import 'package:manafea/ui/home/view/homeScreen.dart';
import 'package:manafea/ui/login/view/loginScreen.dart';
import 'package:manafea/ui/login/widgets/userPersonalDetails.dart';
import 'package:manafea/ui/login/widgets/verifyScreen.dart';
import 'package:manafea/ui/onBoard/view/onBoardingScreen.dart';
import 'package:manafea/ui/splashScreen/view/splashScreen%5D.dart';

import '../ui/carBooking/view/cars_screen.dart';
import '../ui/hotelBooking/view/hotelBookinScreen.dart';

class AppRoutes{
  static const String splash="/";
  static const String onBoard="/sfsdf";
  static const String login="login/";
  static const String verifyScreen="verify";
  static const String homeScreen="home";
  static const String bottomNav="sdf/";
  static const String personDetailed="err";
  static const String hotels="hotel";
  static const String carsScreen="car";
  static const String carBooking="car";
}

class Routes{

  static onGenerate(RouteSettings setting){
    switch (setting.name){
      case AppRoutes.onBoard:
        return MaterialPageRoute(builder: (context) => const Onboardingscreen(),);
      case AppRoutes.verifyScreen:
        return MaterialPageRoute(builder: (context) => const VerifyScreen(),);
      case AppRoutes.carsScreen:
        return MaterialPageRoute(builder: (context) => const CarsScreen(

        ),);

      case AppRoutes.carBooking:
        return MaterialPageRoute(builder: (context) => const CarBookingScreen(


        ),);
        case AppRoutes.hotels:
        return MaterialPageRoute(builder: (context) => const HotelBookingScreen(),);

          case AppRoutes.personDetailed:
        return MaterialPageRoute(builder: (context) => const
        UserPersonalDetails(),) ;


      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);

      case AppRoutes.login:
        return MaterialPageRoute(builder: (context)
        => const LoginScreen(),);

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context)
        => const HomeScreen(),);
      case AppRoutes.bottomNav:
        return MaterialPageRoute(builder: (context)
        => const BottomNav(),);

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
  }}
