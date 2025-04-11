import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';

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
        _buildTransportationText(),
          SizedBox(height: 0.01 * AppConstants.screenHeight), // Adjust space based on screen height
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04 * AppConstants.screenWidth), // Adjust padding based on screen width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTransportWidget(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.carBooking);
                  },
                  icon: Icons.directions_car, iconName: "Car"),
              _buildTransportWidget(icon: Icons.directions_bus, iconName: "Bus"),
              _buildTransportWidget(icon: Icons.local_taxi, iconName: "Taxi"),
              _buildTransportWidget(icon: Icons.motorcycle, iconName: "Bike"),
            ],
          ),
        ),
      ],
    );
  }





  Widget _buildTransportWidget({required IconData icon,
    required String iconName,
  Function? onTap
  }) {
    bool isSelected = selectedIcon == icon;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = isSelected ? null : icon;
        });
        Future.delayed(Duration(milliseconds: 700), () {
          onTap!();
        });

      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(0.034 * AppConstants.screenWidth), // Adjust padding based on screen width
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
              size: 0.076 * AppConstants.screenWidth, // Adjust icon size based on screen width
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
            SizedBox(height: AppConstants.screenHeight*0.0087),
          Text(
            iconName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primaryColor : Colors.black54,
              fontSize: 0.035 * AppConstants.screenWidth, // Adjust font size based on screen width
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportationText() {
    return Padding(
      padding: EdgeInsets.only(left: 0.042 * AppConstants.screenWidth), // Adjust padding based on screen width
      child: Text(
        '#ChooseYourTransportation',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: AppColors.primaryColor,
          fontSize: AppConstants.screenWidth * 0.056,
        ),
      ),
    );
  }
}