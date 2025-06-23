import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:table_calendar/table_calendar.dart';

import 'customShowCalender.dart';

class CheckInCheckOut extends StatefulWidget {
  String? checkInDateString;
  String? checkOutDateString;
  Function(DateTime) onSelectCheckInDate;
  Function(DateTime) onSelectCheckOutDate;
  Function calculatePrice;
  DateTime focusedDateCheckOutDate;
  DateTime focusedDateCheckInDate;

  String headlineOne;
  String headlineTwo;
  CheckInCheckOut({
    required this.checkInDateString,
    required this.calculatePrice,
    required this.onSelectCheckOutDate,
    required this.onSelectCheckInDate,
    required this.headlineTwo,
    required this.headlineOne,
    required this.focusedDateCheckInDate,
    required this.checkOutDateString,
    required this.focusedDateCheckOutDate,
  });

  @override
  _CheckInCheckOutState createState() => _CheckInCheckOutState();
}

class _CheckInCheckOutState extends State<CheckInCheckOut> {
  String calculateStayDuration(
      DateTime checkIn, DateTime checkOut) {
      final normalizedCheckIn =
      DateTime(checkIn.year, checkIn.month, checkIn.day);
    final normalizedCheckOut =
    DateTime(checkOut.year, checkOut.month, checkOut.day);
    final duration = normalizedCheckOut.difference(normalizedCheckIn);
    int days = duration.inDays;

    print(duration);
    print(days);

    if (widget.checkOutDateString==LocaleKeys.hotelsScreen_select_Date.tr()){
      days=0;
      setState(() {

      });
    }

    return '$days ${days == 1 ? 'day' : 'days'}';
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          padding:   EdgeInsets.all(AppConstants.screenWidth*0.044),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCheckInWidget(widget.checkInDateString!,
                  widget.focusedDateCheckInDate),
              _buildCheckoutWidget(widget.checkOutDateString!
                  , widget.focusedDateCheckOutDate),
            ],
          ),
        ),
          SizedBox(height: AppConstants.screenHeight*0.024),
        // Display the duration of the stay (difference between check-in and check-out)
        // Text(
        //   'Stay Duration: ${calculateStayDuration(widget.focusedDateCheckInDate, widget.focusedDateCheckOutDate)}',
        //   style: TextStyle(fontSize: AppConstants.screenWidth*0.044, fontWeight: FontWeight.bold),
        // ),


      ],
    );
  }

  Widget _buildCheckoutWidget(String todayDate, DateTime focusedDate)
  {
    return GestureDetector(
      onTap: () =>  showCalendarDialog(
        context: context,
        focusedDateCheckInDate: widget.focusedDateCheckInDate,
        calculatePrice: widget.calculatePrice,
        onSelectDate: widget.onSelectCheckOutDate,
        focusedDate: focusedDate,
        checkIn: false
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.headlineOne,
            style: TextStyle(
              fontSize: AppConstants.screenWidth*0.044,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
            SizedBox(height: AppConstants.screenHeight*0.008),
          Text(
        todayDate,
            style:   TextStyle(
              fontSize: AppConstants.screenWidth*0.04,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInWidget(String todayDate, DateTime focusedDate) {
    return GestureDetector(
      onTap: () =>
         showCalendarDialog(
             context: context,
             focusedDateCheckInDate: widget.focusedDateCheckInDate,
             calculatePrice: widget.calculatePrice,
              onSelectDate: widget.onSelectCheckInDate,
              focusedDate: focusedDate,
              checkIn: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headlineTwo,
            style: TextStyle(
              fontSize: AppConstants.screenWidth*0.044,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
            SizedBox(height: AppConstants.screenHeight*0.007),
          Text(
            todayDate,
            style:   TextStyle(
              fontSize: AppConstants.screenWidth*0.038,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


}
