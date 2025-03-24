import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckInCheckOut extends StatefulWidget {
  @override
  _CheckInCheckOutState createState() => _CheckInCheckOutState();
}

class _CheckInCheckOutState extends State<CheckInCheckOut> {
  DateTime focusedDate = DateTime.now();

  void changeDate(DateTime newDate) {
    setState(() {
      focusedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('dd/MM/yyyy').format(focusedDate);

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
              _buildCheckInWidget(todayDate),
              _buildCheckoutWidget(todayDate),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCheckoutWidget(String todayDate) {
    return GestureDetector(
      onTap: () => _showCalendarDialog(),
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

  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = focusedDate;

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Center(
            child: Text(
              "Select Date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
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
                  selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                    });
                    changeDate(selectedDay);
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
                    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blueGrey, size: 28),
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blueGrey, size: 28),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                    weekdayStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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
                    defaultTextStyle: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
                    outsideDaysVisible: false,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckInWidget(String todayDate) {
    return GestureDetector(
      onTap: () => _showCalendarDialog(),
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
}
