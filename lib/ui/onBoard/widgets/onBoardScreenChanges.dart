import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/appColors.dart';
import '../../../domain/models/onBoardModel.dart';

class OnBoardScreenChanges extends StatefulWidget {
   OnBoardScreenChanges({super.key,required this.index,
   required this.changeIndex,
   required this.pageController,
   required this.onChangedSmooth,
   });

   int index;
   Function changeIndex;
   Function onChangedSmooth;
   PageController pageController;
  @override
  State<OnBoardScreenChanges> createState() => _OnBoardScreenChangesState();
}

class _OnBoardScreenChangesState extends State<OnBoardScreenChanges> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal:
        AppConstants.screenWidth*0.08
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          skipButton(),
          smoothIndicator(),
          nextButtons(),



        ],
      ),
    );
  }
  smoothIndicator(){
    return    SmoothPageIndicator(

      controller:PageController(initialPage: widget.index),
      count: OnBoardModel.items.length,
      effect: const ExpandingDotsEffect(
        spacing: 6.0,
        radius: 10.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        expansionFactor: 3.8,
        dotColor: Colors.grey,
        activeDotColor: AppColors.primaryColor,
      ),
      onDotClicked: (newIndex) {
        widget.onChangedSmooth;

      },
    );
  }
  skipButton(){
    return GestureDetector(
      child: Container(
      //  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700], // Subtle but visible color
          ),
        ),
      ),
    );
  }

 Widget nextButtons() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: (1 / OnBoardModel.items.length) * (widget.index + 1),
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutBack,
          builder: (context, double value, _) => SizedBox(
            height: AppConstants.screenHeight * 0.082,
            width: AppConstants.screenWidth * 0.18,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: AppConstants.screenWidth * 0.015,
              backgroundColor: const Color(0xFFF2F2F2),
              color: AppColors.primaryColor,
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                fixedSize: Size(
                  AppConstants. screenWidth * 0.13,
                  AppConstants.screenHeight * 0.065,
                ),
                shape: const CircleBorder()),
            onPressed: () {
              widget.changeIndex();


            },
            child: Icon(Icons.arrow_forward_ios_sharp,
                color: Colors.white),
            )
      ],
    );
  }


}
