import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import 'buildLocationWidget.dart';

Widget buildBookingDescription({
  required String BookingTittle,
  required String description,
  required String location,
  required String googleMapsUrl,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// العنوان مع زر المزيد
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppConstants.screenWidth*0.7,
            child: Text(
            overflow: TextOverflow.ellipsis,
              BookingTittle,
              style: TextStyle(
                overflow: TextOverflow.ellipsis ,
                fontSize: AppConstants.screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          InfoIconDialog(
            location: location,
            description: description,
            url: googleMapsUrl,

          )

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