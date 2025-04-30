import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget serviceName({
  required String name
}){
  return     Padding(
      padding: const EdgeInsets.symmetric(
      horizontal: 14.0, vertical: 0), child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        textAlign: TextAlign.start,
        name,
        style: TextStyle(
            fontWeight: FontWeight.w900,

              fontSize: AppConstants.screenWidth * 0.056,

            color: AppColors.primaryColor),
      ),

    ],
  ));}