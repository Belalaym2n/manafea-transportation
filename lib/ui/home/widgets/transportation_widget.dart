import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';

class TransportationWidget extends StatefulWidget {
  const TransportationWidget({super.key});

  @override
  State<TransportationWidget> createState() => _TransportationWidgetState();
}

class _TransportationWidgetState extends State<TransportationWidget> {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _chooseText(),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _transportWidget(icon: Icons.directions_car, iconName: "Car"),
              _transportWidget(icon: Icons.directions_bus, iconName: "Bus"),
              _transportWidget(icon: Icons.local_taxi, iconName: "Taxi"),
              _transportWidget(icon: Icons.motorcycle, iconName: "Bike"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _transportWidget({required IconData icon, required String iconName}) {
    bool isSelected = selectedIcon == icon;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = isSelected ? null : icon;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primaryColor : Colors.grey[300],
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                )
              ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            iconName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primaryColor : Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseText() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        'Choose Your Transportation',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppConstants.screenWidth * 0.05,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}