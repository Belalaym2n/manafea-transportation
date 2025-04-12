import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import '../../../config/appConstants.dart';

Widget buildHotelBookingOrder({
  required RequestHotelBooking order
}) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Name Section
            Text(
              order.service,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppConstants.screenWidth * 0.038,
                color: Colors.black87,
              ),
            ),
              SizedBox(height: AppConstants.screenHeight*0.012),

            // Check-in and Check-out Information Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Check-in info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check-in",
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      order.checkIn.toString(),
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),

                // Check-out info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check-out",
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      order.checkOut.toString(),
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
              SizedBox(height: AppConstants.screenHeight*0.018),

            // Optional: Add more details or actions if needed

          ],
        ),
      ),
    ),
  );
}
