import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/onBoard/widgets/onBoardItem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/appColors.dart';
import '../../../domain/models/onBoardModel.dart';
import '../widgets/animationDo.dart';
import '../widgets/onBoardScreenChanges.dart';

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
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child:  OnBoardItem(index: currentIndex)

                ),

              SizedBox(
                height: AppConstants.screenHeight*0.07,
              ),
              Expanded(
                flex: 1,
                child: OnBoardScreenChanges(
                  pageController: pageController,
                  index: currentIndex,
                  changeIndex: () {

                      Timer(
                        //aa@gmail.mas 1234567
                        const Duration(milliseconds: 300),
                        () {
                          if (currentIndex < 2) {
                            currentIndex++;
                            setState(() {});
                          } else {
                         Navigator.pushNamed(context, AppRoutes.bottomNav);
                          }
                        },
                      );

                  },
                  onChangedSmooth: () {
                    setState(() {
                      pageController.animateToPage(currentIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
