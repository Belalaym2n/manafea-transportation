import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import '../../../../config/appConstants.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../orderItem/orderItem.dart';

class HotelOrderWidgetStrategy extends OrderWidgetStrategy {
  static final _instance = HotelOrderWidgetStrategy._();

  HotelOrderWidgetStrategy._() {
    OrderWidgetStrategy.register(this);
  }

  factory HotelOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestHotelBooking;

  @override
  Widget buildWidget(BaseOrder order, Function(String) cancelOrder) {
    return OrderItem(
      orderName: order.name,
      orderType: LocaleKeys.orders_screen_hotel_nae.tr(),
      cancelOrder: cancelOrder,
      order: order,
      orderDetailedChanged: buildHotelWidget(hotel: order as RequestHotelBooking),
    );
  }
}

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
