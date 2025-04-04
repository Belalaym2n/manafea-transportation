import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckInCheckOut extends StatefulWidget {
  String? checkInDateString;
  String? checkOutDateString;
  Function(DateTime) onSelectCheckInDate;
  Function(DateTime) onSelectCheckOutDate;
  DateTime focusedDateCheckOutDate;
  DateTime focusedDateCheckInDate;

  CheckInCheckOut({
    required this.checkInDateString,
    required this.onSelectCheckOutDate,
    required this.onSelectCheckInDate,
    required this.focusedDateCheckInDate,
    required this.checkOutDateString,
    required this.focusedDateCheckOutDate,
  });
  @override
  _CheckInCheckOutState createState() => _CheckInCheckOutState();
}

class _CheckInCheckOutState extends State<CheckInCheckOut> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
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
              _buildCheckInWidget(widget.checkInDateString!,widget.focusedDateCheckInDate),
              _buildCheckoutWidget(widget.checkOutDateString!,widget.focusedDateCheckOutDate),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCheckoutWidget(String todayDate,DateTime focusedDate) {
    return GestureDetector(
      onTap: () => _showCalendarDialog(
        onSelectDate: widget.onSelectCheckOutDate,
        focusedDate: focusedDate,
//focusedDate: DateTime.now().add(const Duration(days: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Check-out",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            todayDate,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInWidget(
      String todayDate,DateTime focusedDate) {
    return GestureDetector(
      onTap: () =>
          _showCalendarDialog(
            onSelectDate: widget.onSelectCheckInDate,
            focusedDate: focusedDate,
              //focusedDate: DateTime.now(),
              checkIn: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Check-in",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            todayDate,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  void _showCalendarDialog(
      {
        required Function(DateTime) onSelectDate,
        required DateTime focusedDate,
        bool checkIn = false}) {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = focusedDate;

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Center(
            child: Text(
              "Select Date",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          content: SizedBox(
            height: 400,
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (context, setState) {
                return TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2040, 12, 31),
                  focusedDay: selectedDate,
                  selectedDayPredicate: (day) =>
                      isSameDay(selectedDate, day),
                  onDaySelected: (selectedDay, focusedDay) {

                    setState(() {
                      selectedDate = selectedDay;
                    });
                    onSelectDate(selectedDate);

                    Future.delayed(
                      Duration(milliseconds: 700),
                      () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    leftChevronIcon: Icon(Icons.chevron_left,
                        color: Colors.blueGrey, size: 28),
                    rightChevronIcon: Icon(Icons.chevron_right,
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
                    selectedDecoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: const TextStyle(color: Colors.red),
                    defaultTextStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    outsideDaysVisible: false,
                    disabledTextStyle: TextStyle(
                        color: Colors.grey), // تغيير لون الأيام غير المسموح بها
                  ),
                  enabledDayPredicate: (day) {
                    return checkIn == true
                        ? !day.isBefore(
                            DateTime.now().
                            subtract(Duration(days: 1)))
                        : !day.isBefore(DateTime
                            .now()); // تعطيل الأيام التي بعد focusedDate
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
