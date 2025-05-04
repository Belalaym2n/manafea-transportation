
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';

import '../../../../config/appConstants.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../orderItem/orderItem.dart';

class ActivityOrderWidgetStrategy extends OrderWidgetStrategy {
  static final _instance = ActivityOrderWidgetStrategy._();

  ActivityOrderWidgetStrategy._() {
    OrderWidgetStrategy.register(this);
  }

  factory ActivityOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestActivityOrderModel;

  @override
  Widget buildWidget(BaseOrder order, Function(String) cancelOrder) {
    final activityOrder = order as RequestActivityOrderModel;

    return OrderItem(
      orderName: activityOrder.activityName ?? "Activity",
      orderType:LocaleKeys.orders_screen_activity.tr(),

      cancelOrder: cancelOrder,
      order: activityOrder,
      orderDetailedChanged: orderActivityWidget(order: activityOrder),
    );
  }
}


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
        LocaleKeys.orders_screen_activity.tr(),
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
            LocaleKeys.orders_screen_booking_day.tr(),
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
          LocaleKeys.orders_screen_people_count.tr(), // تأكد أن ده موجود في BaseOrder
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
