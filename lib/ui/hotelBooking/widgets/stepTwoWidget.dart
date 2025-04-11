// 3dd el afrad

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/ui/hotelBooking/widgets/stepOneWidget.dart';

import '../../../config/appConstants.dart';


buildStepTwoContentInStepperForCommonRoomChooseManOrWoman({
required Function(String) chooseType,
required String selectedCommonRoomType,
}){
  return  Column(
      children: [
        Text(
          "Please Choose Common Room type ?",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.01,
        ),
        buildChooseRoom(
          onTap: () => chooseType("Female"),
          isSelected: selectedCommonRoomType == "Female",
          text: "Female",
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
        buildChooseRoom(
          isSelected: selectedCommonRoomType == "Male",
          text: "Male",
          onTap: () => chooseType("Male"),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
      ],
    );
  }


