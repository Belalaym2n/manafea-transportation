import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/getOrders/sharedOrdersWidget/sharedWidget.dart';
import '../../../config/appConstants.dart';
import '../../../domain/models/hotelModels/requestHotelBooking.dart';
import '../../../generated/locale_keys.g.dart';



Widget buildHotelWidget({required RequestHotelBooking hotel}) {
  return buildOrderWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.orders_screen_hotel_booking.tr(),
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
                dataValue: hotel.checkIn.toString(),
                dateName: LocaleKeys.orders_screen_check_in.tr()

            ),
            buildDateWidget(
                dateName:LocaleKeys.orders_screen_check_out.tr(), dataValue: hotel.checkOut.toString())
          ],
        ),
        SizedBox(height: AppConstants.screenHeight * 0.018),
      ],
    ),
  );
}
