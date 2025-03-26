// 3dd el afrad

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/ui/hotelBooking/widgets/stepOneWidget.dart';

import '../../../config/appConstants.dart';


buildStepTwoContentInStepperForCommonRoomJust({
required Function(String) onSelectRoom,
required String selectedCoomonRoomType,
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
          onTap: () => onSelectRoom("Female"),
          isSelected: selectedCoomonRoomType == "Female",
          text: "Female",
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
        buildChooseRoom(
          isSelected: selectedCoomonRoomType == "Male",
          text: "Male",
          onTap: () => onSelectRoom("Male"),
        ),
        SizedBox(
          height: AppConstants.screenHeight * 0.02,
        ),
      ],
    );
  }


