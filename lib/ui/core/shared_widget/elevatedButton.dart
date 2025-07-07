import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget elevated_button({
  required Function onPressed,
  required String buttonName,
  bool valid=false,
   Color? bgColor,
  Size? buttonSize,
  bool? loading,
}) =>
    Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize:buttonSize??
              Size(AppConstants.screenWidth,
                  AppConstants.screenHeight / 15),
          backgroundColor:valid==false?
          Colors.grey: bgColor ?? AppColors.primaryColor,

          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        onPressed: () async {

           onPressed() ;
        },
        child: loading == true
            ? CircularProgressIndicator(
          color: Colors.white,
        )
            : Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: AppConstants.screenWidth / 20,
            fontFamily: 'Nexa Bold 650',
          ),
        ),
      ),
    );


Widget smallElevatedButton({
  required String buttonName,
 required Function onTap
}){
  return
     ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize:   Size(0.4388*AppConstants.screenWidth, 0.042*AppConstants.screenHeight), // يحدد الحجم الأدنى للزر
          padding: EdgeInsets.zero, // يزيل الـ padding الافتراضي
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor:AppColors.primaryColor,
        ),
        onPressed: () {
          onTap();
        }, child:  Text(buttonName,style: const TextStyle(
        color: Colors.white
    ),));

}