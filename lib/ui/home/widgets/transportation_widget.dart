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

class _ServicesWidgetState extends State<ServicesWidget>
    with SingleTickerProviderStateMixin {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        serviceName(
          name: LocaleKeys.home_screen_choose_your_service.tr(),
        ),
        SizedBox(height: 0.02 * AppConstants.screenHeight),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.07 * AppConstants.screenWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAnimatedService(
                icon: Icons.directions_car,
                label: LocaleKeys.screensName_car.tr(),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CarsScreen(),
                  ),
                ),
              ),
              _buildAnimatedService(
                icon: Icons.local_activity,
                label: LocaleKeys.screensName_activities.tr(),
                onTap: () => Navigator.pushNamed(
                    context, AppRoutes.activityBooking),
              ),
              _buildAnimatedService(
                icon: Icons.hotel,
                label: LocaleKeys.screensName_hotels.tr(),
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.filterHotels),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedService({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    bool isSelected = selectedIcon == icon;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = icon;
        });

        Future.delayed(const Duration(milliseconds: 300), () {
          onTap();
        });

        Future.delayed(const Duration(milliseconds: 800), () {
          setState(() {
            selectedIcon = null;
          });
        });
      },
      child: Column(
        children: [
          AnimatedScale(
            scale: isSelected ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding:
              EdgeInsets.all(0.045 * AppConstants.screenWidth),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                isSelected ? AppColors.primaryColor : Colors.grey[200],
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  )
                ]
                    : [],
              ),
              child: Icon(
                icon,
                size: 0.076 * AppConstants.screenWidth,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 200),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 0.036 * AppConstants.screenWidth,
                color:
                isSelected ? AppColors.primaryColor : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
