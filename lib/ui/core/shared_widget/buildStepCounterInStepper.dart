import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';

Widget buildStepCounterInStepper({
  required Function increaseCount,
  required Function minusCount,
  required String title,
  required int count,
  required int totalPrice,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 8.0),
    child: SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppConstants.screenWidth * (16 / 360),
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: AppConstants.screenHeight * (5 / 776),
              ),
              SizedBox(
                width: AppConstants.screenWidth*0.4 ,
                child: Text(
                  "${LocaleKeys.hotelsScreen_per_day.tr()}:$totalPrice",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(

                    fontSize: AppConstants.screenWidth * (12 / 360),
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.screenWidth * (8 / 360),
              vertical: AppConstants.screenHeight * (5 / 776),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(AppConstants.screenWidth * (10 / 360)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => minusCount(),
                  icon: Icon(
                    Icons.remove,
                    color: AppColors.primaryColor,
                    size: AppConstants.screenWidth * (18 / 360),
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(

                    fontSize: AppConstants.screenWidth * (14 / 360),
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  onPressed: () => increaseCount(),
                  icon: Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: AppConstants.screenWidth * (18 / 360),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
