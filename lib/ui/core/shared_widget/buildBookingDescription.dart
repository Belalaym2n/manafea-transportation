import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget buildBookingDescription({
  required String BookingTittle,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// العنوان مع زر المزيد
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(

            BookingTittle,
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            splashRadius: AppConstants.screenWidth * 0.05,
            icon: Icon(
              Icons.more_horiz,
              size: AppConstants.screenWidth * 0.06,
              color: Colors.black54,
            ),
          ),
        ],
      ),

      /// وصف الفندق
      SizedBox(
         child: Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 3, // عدد السطور اللي تسمح بيها قبل ظهور ...
          style: TextStyle(
            fontSize: AppConstants.screenWidth * 0.04,
            color: AppColors.lightBlack,
            height: 1.5,
          ),
        ),
      ),

    ],
  );
}