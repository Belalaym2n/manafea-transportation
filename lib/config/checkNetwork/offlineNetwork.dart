 import 'package:flutter/material.dart';

import '../appColors.dart';
import '../appConstants.dart';


class OfflineNetwork extends StatefulWidget {
  const OfflineNetwork({super.key});

  @override
  State<OfflineNetwork> createState() => _CheckNetworkState();
}

class _CheckNetworkState extends State<OfflineNetwork> {
  bool isDesktop(double width) => width >= 1024;

  bool isTablet(double width) => width >= 600 && width < 1024;

  bool isMobile(double width) => width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          if (isDesktop(w)) {
            return buildOfflineNetwork(true);
          } else if (isTablet(w)) {
            return buildOfflineNetwork(false);
          } else {
            return buildOfflineNetwork(false);
          }
        },
      ),
    );
  }

  Widget buildOfflineNetwork(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.wifi_off,
            color: AppColors.primaryColor,
            size:  isDesktop?
            AppConstants.screenWidth * 0.2:
            AppConstants.screenWidth * 0.28,
          ),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.02),
        Text(
          "No Internt Connection ",
          style: TextStyle(
            fontSize: isDesktop?
            AppConstants.screenWidth * 0.018:
            AppConstants.screenWidth * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.01),
        Text(
          "No Internt Connection found check your \n            connection and try again",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize:  isDesktop?
            AppConstants.screenWidth * 0.01:
            AppConstants.screenWidth * 0.03,
          ),
        ),
        IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
      ],
    );
  }
}
