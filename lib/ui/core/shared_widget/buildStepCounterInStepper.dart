import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';

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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppConstants.screenWidth * (18 / 360),
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
                "Per Day:$totalPrice",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(

                  fontSize: AppConstants.screenWidth * (16 / 360),
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenWidth * (10 / 360),
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
                  size: AppConstants.screenWidth * (24 / 360),
                ),
              ),
              Text(
                "$count",
                style: TextStyle(
                  fontSize: AppConstants.screenWidth * (20 / 360),
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                onPressed: () => increaseCount(),
                icon: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: AppConstants.screenWidth * (24 / 360),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
