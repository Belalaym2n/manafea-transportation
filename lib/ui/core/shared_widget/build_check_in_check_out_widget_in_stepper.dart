import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:table_calendar/table_calendar.dart';

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
      onTap: () => _showCalendarDialog(
        onSelectDate: widget.onSelectCheckOutDate,
        focusedDate: focusedDate,
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
          _showCalendarDialog(
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

  void _showCalendarDialog(
      {required Function(DateTime) onSelectDate,
        required DateTime focusedDate,
        bool checkIn = false}) {
    showDialog(

      context: context,
      builder: (context) {
        DateTime selectedDate = focusedDate;

        return AlertDialog(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:   Center(
            child: Text(
              "Select Date",
              style: TextStyle(
                  fontSize: AppConstants.screenWidth*0.056,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              height: AppConstants.screenHeight*0.54  ,
              width: double.maxFinite,
              child: StatefulBuilder(

                builder: (context, setState) {
                  return TableCalendar(
                      locale: context.locale.languageCode,  // هذا يجعل الواجهة تتغير حسب اللغة

                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2040, 12, 31),
                      focusedDay: selectedDate,
                      selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          selectedDate = selectedDay;
                        });
                        onSelectDate(selectedDate);
                       widget.calculatePrice();
                        Future.delayed(
                          Duration(milliseconds: 700),
                              () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      headerStyle:   HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            fontSize: AppConstants.screenWidth*0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        leftChevronIcon:
                        Icon(Icons.chevron_left, color:
                        Colors.blueGrey, size: AppConstants.screenWidth*0.08),
                        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blueGrey, size: 28),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekendStyle: TextStyle(
                            color: Colors.redAccent, fontWeight: FontWeight.bold),
                        weekdayStyle: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle,
                        ),
                        weekendTextStyle: const TextStyle(color: Colors.red),
                        defaultTextStyle:   TextStyle(
                            color: Colors.black87, fontSize:
                        AppConstants.screenWidth*0.044, fontWeight: FontWeight.w500),
                        outsideDaysVisible: false,
                        disabledTextStyle: TextStyle(
                            color: Colors.grey), // Change the color of disabled days
                      ),
                      enabledDayPredicate: (day) {
                        print(widget.focusedDateCheckInDate);
                        if (checkIn) {
                          return !day.isBefore(DateTime.now().subtract(const Duration(days: 1)));

                        } else {
                          return !day.isBefore(widget.focusedDateCheckInDate.add(const Duration(days: 1)));

                        }
                      }
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
