
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/onBoard/widgets/onBoardItem.dart';

import '../../../domain/models/onBoardModel.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<OnBoardModel> items = OnBoardModel.items;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SizedBox(
          width: AppConstants.screenWidth,
          height: AppConstants.screenHeight,
          child: OnBoardItem(index: 1),
        ));
  }
}
