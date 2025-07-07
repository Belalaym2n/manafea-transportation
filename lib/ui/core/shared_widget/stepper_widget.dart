import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';

import '../../../config/appColors.dart';

Step buildStep({
  required bool colorIndex,
  required bool isActive,
  required Widget content,
  required String tittle,
  required bool isCurrentStep,
}) {
  return Step(

    stepStyle: StepStyle(
      indexStyle: TextStyle(
        color: colorIndex ? Colors.white : AppColors.primaryColor,
      ),
      color: AppColors.primaryColor,
    ),
    isActive: isActive,
    title: AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: isCurrentStep ? 0.05*AppConstants.screenWidth : 0.0388*AppConstants.screenWidth,
        fontWeight: FontWeight.bold,
        color: isCurrentStep ? AppColors.primaryColor : Colors.grey,
      ),
      child: tittleName(tittle),
    ),
    content: Column(
      children: [content],
    ),
  );
}


Text tittleName(String tittle) {
  return Text(
    tittle,
    style: TextStyle(
      fontSize: AppConstants.screenWidth * 0.04,
      fontWeight: FontWeight.w600,
      color: Colors.black, // لون من الألوان الأساسية المريحة
    ),
  );
}
