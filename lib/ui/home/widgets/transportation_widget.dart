import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';

class TransportationWidget extends StatefulWidget {
  const TransportationWidget({super.key});

  @override
  State<TransportationWidget> createState() => _TransportationWidgetState();
}

class _TransportationWidgetState extends State<TransportationWidget> {
  // Variable to track selected icon
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        chooseText(),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              transportWidget(icon: Icons.car_crash),
              transportWidget(icon: Icons.bus_alert_rounded),
              transportWidget(icon: Icons.business_center),
              transportWidget(icon: Icons.motorcycle_sharp),
            ],
          ),
        ),
      ],
    );
  }

  transportWidget({required IconData icon}) {
    bool isSelected = selectedIcon == icon; // Check if the current icon is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = isSelected ? null : icon; // Toggle selection
        });
      },
      child: Material(
        color:isSelected ? Colors.black :null ,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.black : Colors.transparent, // Set black background when selected
          ),
          margin: EdgeInsets.all(8),
          height: 40,
          width: 50,
          child: Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.white : Colors.black, // Set white icon when selected
          ),
        ),
      ),
    );
  }

  chooseText() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        'Choose Transportation',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: AppConstants.screenWidth * 0.045,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
