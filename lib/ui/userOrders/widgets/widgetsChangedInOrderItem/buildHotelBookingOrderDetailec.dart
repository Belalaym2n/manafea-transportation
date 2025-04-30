import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import '../../../../config/appConstants.dart';

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
          hotel.service,
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
                dataValue: hotel.checkIn.toString(), dateName: 'Check-in'),
            buildDateWidget(
                dateName: "Check-out", dataValue: hotel.checkOut.toString())
          ],
        ),
        SizedBox(height: AppConstants.screenHeight * 0.018),
      ],
    ),
  );
}

Widget buildCarOrderWidget({required RequestCarBookingOrderModel car}) {
  return buildOrderWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          car.service,
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
                dateName: 'Delivery date'),
            buildDateWidget(
                dateName: "Received-date", dataValue: car.receiptDate.toString())
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
