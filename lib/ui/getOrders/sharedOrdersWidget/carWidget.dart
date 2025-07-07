import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/getOrders/sharedOrdersWidget/sharedWidget.dart';

import '../../../config/appConstants.dart';
import '../../../domain/models/carModels/requestCarBookingOrder.dart';
import '../../../generated/locale_keys.g.dart';

Widget buildCarOrderWidget({required RequestCarBookingOrderModel car}) {
  return buildOrderWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.orders_screen_car.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.screenWidth * 0.038,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.012),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDateWidget(
                dataValue: car.deliveryDate.toString(),
                dateName: LocaleKeys.car_screen_delivery.tr()),
            buildDateWidget(
                dateName: LocaleKeys.car_screen_dispatch.tr(), dataValue: car.receiptDate.toString())
          ],
        ),
        SizedBox(height: AppConstants.screenHeight * 0.018),
      ],
    ),
  );
}
