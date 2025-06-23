import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';

Widget buildOrderWidget({required Widget widget}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.036),
    child: PhysicalModel(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.036),
      child: Container(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(AppConstants.screenWidth * 0.036),
            color: Colors.white,
          ),
          child: widget),
    ),
  );
}


buildDateWidget({required String dateName, required String dataValue,}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        dateName,
        style: TextStyle(
          fontSize: AppConstants.screenWidth * 0.032,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
      Text(
        dataValue,
        style: TextStyle(
          fontSize: AppConstants.screenWidth * 0.032,
          fontWeight: FontWeight.w600,
          color: Colors.blueAccent,
        ),
      ),
    ],
  );
}
