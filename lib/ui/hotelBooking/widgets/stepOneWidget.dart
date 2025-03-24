import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget buildStepOneContentInStepper({
  required Function(String) onSelectRoom,
  required String selectedRoomType,
}) {
  return Column(
    children: [
      Text(
        "Please Choose your Room type ?",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
      ),
      SizedBox(
        height: AppConstants.screenHeight * 0.01,
      ),
      buildChooseRoom(
        onTap: () => onSelectRoom("Special"),
        isSelected: selectedRoomType == "Special",
        text: "Special",
      ),
      SizedBox( 
        height: AppConstants.screenHeight * 0.02,
      ),
      buildChooseRoom(
        isSelected: selectedRoomType == "Common",
        text: "Common",
        onTap: () => onSelectRoom("Common"),
      ),
      SizedBox(
        height: AppConstants.screenHeight * 0.02,
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
        color: isSelected ? Colors.black : Color(0xFFdcdcdc),
        borderRadius: BorderRadius.circular(10),
        elevation: isSelected ? 10 : 0,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? Colors.black
                  : Color(0xFFdcdcdc), // Set black background when selected
            ),
            margin: EdgeInsets.all(8),
            height: 25,
            width: 300,
            child: Center(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.primaryColor,
                  fontSize: AppConstants.screenWidth * 0.045,
                  fontWeight: FontWeight.w900),
            )))),
  );
}
