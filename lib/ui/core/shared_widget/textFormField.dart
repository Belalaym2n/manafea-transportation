import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

textFormField({
  required Widget prefixIcon,
// required Widget suffixIcon,
  required String label,
  bool isShowText=false,
}){
  return  Material(
      borderRadius:
      BorderRadius.circular(AppConstants.screenWidth * 0.04),
      elevation: 5,
      child:TextFormField(

        decoration: InputDecoration(

            label: Text(label,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.screenWidth*0.04
            ),),
             // Set your desired background color here
            filled: true,
            suffixIcon: isShowText?
            Icon(Icons.visibility_off,color: Colors.black,):null,
            prefixIcon: prefixIcon  ,
            focusedBorder:  OutlineInputBorder(

                borderSide:  BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.5
                ),
                borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.04)
            ),
            enabledBorder: OutlineInputBorder(

                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.04)
            )

        ),

      ));
}