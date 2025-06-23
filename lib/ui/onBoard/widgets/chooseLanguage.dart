import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/localization/localization.dart';

Widget buildChooseLanguage(
    {required String text,
      required Function onTap,
      required bool isSelected}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Material(
      color: isSelected ? Colors.black : const Color(0xFFdcdcdc),
      borderRadius: BorderRadius.circular(10),
      elevation: isSelected ? 10 : 0,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? Colors.black
                : const Color(
                0xFFdcdcdc), // Set black background when selected
          ),
          margin: const EdgeInsets.all(8),
          height: AppConstants.screenHeight*0.05,
          width: AppConstants.screenWidth*0.95,
          child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.primaryColor,
                    fontSize: AppConstants.screenWidth * 0.045,
                    fontWeight: FontWeight.w900),
              ))),
    ),
  );
}


languageWidget({
  required BuildContext context,
  required VoidCallback setState1,
  required VoidCallback setState2,
  required VoidCallback setState3,
  required int languageIndex,
}){
  return Column(
    children: [
      Center(
          child: buildChooseLanguage(
              onTap: () {
                context.read<LanguageProvider>().
                changeLanguage(Locale('en'));
                context.setLocale(Locale('en'));
                setState1();

              },
              isSelected: languageIndex == 1,
              text: 'English')),
      SizedBox(
        height: AppConstants.screenHeight*0.04,
      ),
      Center(
          child: buildChooseLanguage(
              onTap: () {
                context.read<LanguageProvider>().changeLanguage(const Locale('ar'));
                context.setLocale(Locale('ar'));

                setState2();
              },
              isSelected: languageIndex == 2,
              text: 'عربى')),
      SizedBox(
        height: AppConstants.screenHeight*0.04,
      ),
      Center(
          child: buildChooseLanguage(
              onTap: () {
                context.read<LanguageProvider>().
                changeLanguage(const Locale('ur'));
                context.setLocale(Locale('ur'));

                setState3();
              },
              isSelected: languageIndex == 3,
              text: 'Urdu')),
    ],
  );
}