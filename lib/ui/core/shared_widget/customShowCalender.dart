import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/appConstants.dart';

void showCalendarDialog(
    {required Function(DateTime) onSelectDate,
    required DateTime focusedDate,
    required BuildContext context,
    required DateTime focusedDateCheckInDate,
    Function? calculatePrice,
    bool checkIn = false}) {

  showDialog(
    context: context,
    builder: (context) {
      DateTime selectedDate = focusedDate;

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            "Select Date",
            style: TextStyle(
                fontSize: AppConstants.screenWidth * 0.056,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            height: AppConstants.screenHeight * 0.54,
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (context, setState) {
                return TableCalendar(
                    locale: context.locale.languageCode,

                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2040, 12, 31),
                    focusedDay: selectedDate,
                    selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                      });
                      onSelectDate(selectedDate);
                      calculatePrice!();
                      Future.delayed(
                        const Duration(milliseconds: 700),
                        () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                          fontSize: AppConstants.screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      leftChevronIcon: Icon(Icons.chevron_left,
                          color: Colors.blueGrey,
                          size: AppConstants.screenWidth * 0.08),
                      rightChevronIcon: const Icon(Icons.chevron_right,
                          color: Colors.blueGrey, size: 28),
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
                      defaultTextStyle: TextStyle(

                          color: Colors.black87,
                          fontSize: MediaQuery.of(context).size.shortestSide > 600 ? 30:
                          (MediaQuery.of(context).size.width * 0.043).clamp(10.0, 16.0),


                          fontWeight: FontWeight.w500),
                      outsideDaysVisible: false,
                      disabledTextStyle: const TextStyle(
                          color:
                              Colors.grey), // Change the color of disabled days
                    ),
                    enabledDayPredicate: (day) {
                      if (checkIn) {
                        return !day
                            .isBefore(DateTime.now()
                            .add(const Duration(days: 0)));
                      } else {
                        return !day.isBefore(focusedDateCheckInDate
                            .add(const Duration(days: 1)));
                      }
                    });
              },
            ),
          ),
        ),
      );
    },
  );
}
