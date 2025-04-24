
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';

import '../../../../config/appConstants.dart';

Widget   orderActivityWidget({
 required RequestActivityOrderModel order
}){
  return Padding(
      padding:   EdgeInsets.symmetric(
      horizontal: AppConstants.screenWidth*0.036),
  child: PhysicalModel(
  color: Colors.white,
  elevation: 4,
  shadowColor: Colors.black.withOpacity(0.1),
  borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036),
  child: Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036),
  color: Colors.white,
  ),
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Activity',
        style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppConstants.screenWidth * 0.038,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Text(
            'Booking Day: ',
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.032,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Text(order.orderDate,style:  TextStyle(
            fontSize: AppConstants.screenWidth * 0.032,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),),
 ]
      )
    ,
      SizedBox(height: 4),
      Row(
        children: [
          Text(
            'People Count: ', // تأكد أن ده موجود في BaseOrder
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.032,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Text(order.peopleCount.toString(),style:  TextStyle(
            fontSize: AppConstants.screenWidth * 0.032,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),),
        ],
      ),
      SizedBox(height: AppConstants.screenHeight*0.018),

    ],
  ),)
));}
