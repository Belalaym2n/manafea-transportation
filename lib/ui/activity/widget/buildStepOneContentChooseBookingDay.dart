import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/appConstants.dart';

class ChooseDayBooking extends StatefulWidget {
  ChooseDayBooking({
    required this.focusedDate,
    required this.dateString,
    required this.onSelectDate,
  });

  String? dateString;
  Function(DateTime) onSelectDate;
  DateTime focusedDate;

  @override
  _ChooseDayBookingState createState() => _ChooseDayBookingState();
}

class _ChooseDayBookingState extends State<ChooseDayBooking> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:   EdgeInsets.symmetric(horizontal: AppConstants.screenWidth*0.053
              , vertical: AppConstants.screenHeight*0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.041*360),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCheckInWidget(widget.dateString.toString()),
                Icon(Icons.calendar_today,
                  color: AppColors.primaryColor, size: 0.0611*AppConstants.screenWidth),
            ],
          ),
        ),
          SizedBox(height: 0.026*AppConstants.screenWidth),
      ],
    );
  }

  void _showCalendarDialog(
     ) {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = widget.focusedDate;

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:   Center(
            child: Text(
              LocaleKeys.activity_screen_step_choose_booking_day.tr(),
              style: TextStyle(
                  fontSize: 0.058*AppConstants.screenWidth,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          content: SizedBox(
            height: 0.515*AppConstants.screenHeight,
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2040, 12, 31),
                      focusedDay:selectedDate,
                      selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          selectedDate = selectedDay;
                        });
                        widget.onSelectDate(selectedDay);
                        Future.delayed(const Duration(milliseconds: 700), () {
                          Navigator.pop(context);
                        });
                      },
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle:   TextStyle(
                            fontSize: 0.05*AppConstants.screenWidth,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        leftChevronIcon: Icon(Icons.chevron_left,
                            color: Colors.green.shade700, size: 0.077*AppConstants.screenWidth),
                        rightChevronIcon: Icon(Icons.chevron_right,
                            color: Colors.green.shade700, size:  0.077*AppConstants.screenWidth),
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
                            color: Colors.black87,
                            fontSize:  0.044*AppConstants.screenWidth,
                            fontWeight: FontWeight.w500),
                        outsideDaysVisible: false,
                      ),
                      enabledDayPredicate: (day) {
                        return
                        day.isAfter(
                            DateTime.now().add(Duration(days: 1)));
                      }),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckInWidget(String todayDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
          LocaleKeys.activity_screen_step_choose_booking_day.tr(),
          style: TextStyle(
            fontSize: AppConstants.screenWidth*0.04,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 5),
        smallElevatedButton(
          buttonName: todayDate,
          onTap: () {
            _showCalendarDialog();
          },
        )
      ],
    );
  }
}
