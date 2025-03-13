import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget serviceName({
  required String name
}){
  return     Padding(
      padding: const EdgeInsets.symmetric(
      horizontal: 12.0, vertical: 0), child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        textAlign: TextAlign.start,
        name,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.screenWidth * 0.045,
            color: AppColors.primaryColor),
      ),
      Text(
        textAlign: TextAlign.start,
        'view all',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize:AppConstants.screenWidth * 0.038,
            color: AppColors.primaryColor),
      ),
    ],
  ));}