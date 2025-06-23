import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../config/appColors.dart';

class CalendarWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged; // Callback Function

  CalendarWidget({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: CalendarTimeline(

        initialDate:widget.selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 360)),
        lastDate: DateTime.now().add(const Duration(days: 360)),
        onDateSelected: (date) {

          widget.onDateChanged(date); // Call the callback function
        },
        dotColor: Colors.white,
        dayColor: Colors.black26,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: AppColors.primaryColor,
        locale: 'ar',
      ),
    );
  }
}
