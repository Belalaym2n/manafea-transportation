import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../config/appColors.dart';
import '../../../../config/appConstants.dart';

Widget buildStepOneContentInStepperChooseRoomType({
  required Function(String) onSelectRoom,
  required String selectedRoomType,
}) {
  return Column(
    children: [
      Text(
        LocaleKeys.hotelsScreen_please_choose_your_room_type.tr(),

        style: TextStyle(
          fontSize: AppConstants.screenWidth * (18 / 360), // 18 -> 0.05 تقريبًا
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: AppConstants.screenHeight * (8 / 776), // كان 0.01
      ),
      buildChooseRoom(
        onTap: () => onSelectRoom("Special"),
        isSelected: selectedRoomType == "Special",
        text: LocaleKeys.hotelsScreen_special.tr(),
      ),
      SizedBox(
        height: AppConstants.screenHeight * (15 / 776), // كان 0.02
      ),
      buildChooseRoom(
        isSelected: selectedRoomType == "Common",
        text: LocaleKeys.hotelsScreen_common.tr(),
        onTap: () => onSelectRoom("Common"),
      ),
      SizedBox(
        height: AppConstants.screenHeight * (15 / 776),
      ),
    ],
  );
}

Widget buildChooseRoom({
  required String text,
  required bool isSelected,
  required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Material(
      color: isSelected ? Colors.black : const Color(0xFFdcdcdc),
      borderRadius: BorderRadius.circular(AppConstants.screenWidth * (10 / 360)),
      elevation: isSelected ? 10 : 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppConstants.screenWidth * (10 / 360)),
          color: isSelected ? Colors.black : const Color(0xFFdcdcdc),
        ),
        margin: EdgeInsets.all(AppConstants.screenWidth * (8 / 360)),
        height: AppConstants.screenHeight * (25 / 776),
        width: AppConstants.screenWidth * (300 / 360),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.primaryColor,
              fontSize: AppConstants.screenWidth * (16 / 360), // كان 0.045
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    ),
  );
}
