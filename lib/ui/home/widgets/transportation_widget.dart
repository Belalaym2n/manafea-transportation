import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/carBooking/view/cars_screen.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
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
              _buildServicesWidget(
                  onTap: (){
                    Navigator.
                    push(context,MaterialPageRoute(builder: (context) => CarsScreen(),));

                  },
                  icon: Icons.directions_car, iconName: "Car"),
              _buildServicesWidget(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.activityBooking);
                  },
                  icon: Icons.local_activity
                  , iconName: "Activity"),
              _buildServicesWidget(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.filterHotels);
                  },
                  icon:
              Icons.hotel, iconName: "Hotels"),
              _buildServicesWidget(icon: Icons.motorcycle, iconName: "Bike"),
            ],
          ),
        ),
      ],
    );
  }





  Widget _buildServicesWidget({required IconData icon,
    required String iconName,
  Function? onTap
  }) {
    bool isSelected =
        selectedIcon == icon;

    return GestureDetector(
      onTap: () {
        setState(() {
          // عكس الحالة: إذا كانت الأيقونة محددة، قم بإلغاء تحديدها (تعيين null)، وإذا لم تكن محددة، حددها.
          selectedIcon = isSelected ? null : icon;
        });

        // تأخير لفترة بسيطة قبل تنفيذ الدالة onTap
        Future.delayed(Duration(milliseconds: 300), () {
          onTap!();
        });

        // نضيف setState ثاني لتغيير الـ selectedIcon لو عايز ترجعه لحالته الأصلية بعد التأخير
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            selectedIcon = isSelected ? icon : null;
          });
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
        '#ChooseYourService',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: AppColors.primaryColor,
          fontSize: AppConstants.screenWidth * 0.056,
        ),
      ),
    );
  }
}