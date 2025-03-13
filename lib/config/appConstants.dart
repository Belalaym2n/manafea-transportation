import 'package:flutter/cupertino.dart';

class AppConstants{

  static const String imageUrl="assets/images/";
  static late double screenHeight;
  static late double screenWidth;

  static void initSize(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
  }
}
