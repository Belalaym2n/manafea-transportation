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

Widget buildTextFormFieldForAuth({
  required String hint,
  required TextEditingController controller,
  required double screenWidth,
  required String errorValidator  ,
    IconData? icon  ,
}) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorValidator;
      }
      return null;
    },
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: screenWidth * 0.05,
    ),
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      suffixIcon: icon==null?  const Icon(Icons.person):Icon(icon),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w700,
        fontSize: screenWidth * 0.05,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      enabledBorder: UnderlineInputBorder(
        borderSide:
        BorderSide(color: Colors.grey.shade400, width: 1.5),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightBlack, width: 2),
      ),
    ),
  );
}