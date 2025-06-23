import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/carBooking/view/cars_screen.dart';
import 'package:manafea/ui/home/widgets/serviceName.dart';

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
        serviceName(name:         LocaleKeys.home_screen_choose_your_service.tr(),


        ),
          SizedBox(height: 0.01 * AppConstants.screenHeight), // Adjust space based on screen height
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.07 * AppConstants.screenWidth), // Adjust padding based on screen width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildServicesWidget(
                  onTap: (){
                    Navigator.
                    push(context,MaterialPageRoute(builder:
                        (context) => const CarsScreen(),));

                  },
                  icon: Icons.directions_car,
                  iconName: LocaleKeys.screensName_car.tr()),
              _buildServicesWidget(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.activityBooking);
                  },
                  icon: Icons.local_activity
                  , iconName:  LocaleKeys.screensName_activities.tr()),
              _buildServicesWidget(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.filterHotels);
                  },
                  icon:
              Icons.hotel, iconName:  LocaleKeys.screensName_hotels.tr()),
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
           selectedIcon = isSelected ? null : icon;
        });

         Future.delayed(Duration(milliseconds: 300), () {
          onTap!();
        });

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
            padding: EdgeInsets.all(0.044 * AppConstants.screenWidth), // Adjust padding based on screen width
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


}