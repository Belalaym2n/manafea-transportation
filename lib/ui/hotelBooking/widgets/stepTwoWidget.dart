// 3dd el afrad

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/ui/hotelBooking/widgets/stepOneWidget.dart';

import '../../../config/appConstants.dart';

buildStepTwoStepperContentSpecialRoom({
  required Function increaseCount,
  required Function minusCount,
  required String title,
  required int count,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر
    children: [
       Text(
        title, // العنوان
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // زر الناقص
            IconButton(
              onPressed: () {
                minusCount();
              },
              icon: Icon(
                Icons.remove,
                color: AppColors.primaryColor,
              ),
            ),

            // الرقم
            Text(
              "$count",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

            // زر الزائد
            IconButton(
              onPressed: () {
                increaseCount();
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

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


