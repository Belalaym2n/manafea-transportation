// 3dd el afrad

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/ui/hotels/hotelBooking/widgets/stepOneWidget.dart';

import '../../../../config/appConstants.dart';
import '../../../../generated/locale_keys.g.dart';



buildStepTwoContentInStepperForCommonRoomChooseManOrWoman({
required Function(String) chooseType,
required String selectedCommonRoomType,
}){
  return  Column(
      children: [
        Text(
          LocaleKeys.hotelsScreen_please_choose_your_room_type.tr(),
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.01,
        ),
        buildChooseRoom(
          onTap: () => chooseType("Female"),
          isSelected: selectedCommonRoomType == "Female",
          text:LocaleKeys.fedsmale.tr(),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
        buildChooseRoom(
          isSelected: selectedCommonRoomType == "Male",
          text: LocaleKeys.masdfle.tr(),
          onTap: () => chooseType("Male"),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
      ],
    );
  }


