import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

import '../../../../config/appConstants.dart';
import '../../../../generated/locale_keys.g.dart';

class BuildStepOneContentInStepperChooseLocation extends StatefulWidget {
  final String selectedLocation;
  final Function(String) changeLocation;

  BuildStepOneContentInStepperChooseLocation({
    Key? key,
    required this.selectedLocation,
    required this.changeLocation,
  }) : super(key: key);

  @override
  State<BuildStepOneContentInStepperChooseLocation> createState() =>
      _BuildStepOneContentInStepperChooseLocationState();
}

class _BuildStepOneContentInStepperChooseLocationState
    extends State<BuildStepOneContentInStepperChooseLocation> {
  bool isExpanded = false;

  final List<String> locations = [
    LocaleKeys.locations_riyadh,
    LocaleKeys.locations_jeddah,
    LocaleKeys.locations_makkah,
    LocaleKeys.locations_madinah,
    LocaleKeys.locations_dammam,
    LocaleKeys.locations_khobar,
    LocaleKeys.locations_taif,
    LocaleKeys.locations_buraidah,
    LocaleKeys.locations_abha,
    LocaleKeys.locations_hail,
    LocaleKeys.locations_tabuk,
    LocaleKeys.locations_yanbu,
    LocaleKeys.locations_qassim,
    LocaleKeys.locations_jazan,
    LocaleKeys.locations_najran,
    LocaleKeys.locations_al_bahah,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = AppConstants.screenWidth;
    final screenHeight = AppConstants.screenHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(height: screenHeight * 0.01),
        buildLocationToggle(),
        buildSelectedLocationList(),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  Widget buildLocationToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: isExpanded
              ? const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
              : BorderRadius.circular(10),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.024),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.screenWidth * 0.048,
          vertical: AppConstants.screenHeight * 0.014,
        ),
        width: AppConstants.screenWidth * 0.87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedLocation,
              style: TextStyle(
                color: Colors.white,
                fontSize: AppConstants.screenWidth * 0.045,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              isExpanded
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_circle,
              color: Colors.white,
              size: AppConstants.screenWidth * 0.09,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedLocationList() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? locations.length * 50.0 : 0,
      margin:   EdgeInsets.symmetric(horizontal: 0.022*AppConstants.screenWidth),
      curve: Curves.easeInOut,
      child: ClipRRect(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            bool isSelected = locations[index].tr() == widget.selectedLocation;
            return GestureDetector(
              onTap: () {
                widget.changeLocation(locations[index].tr());

                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    isExpanded = false;
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenWidth * 0.048,
                  vertical: AppConstants.screenHeight * 0.014,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: isSelected
                      ? [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                      : [],
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: isSelected ? 1.05 : 1.0,
                  child: Text(
                    locations[index].tr(),
                    style: TextStyle(
                      fontSize: AppConstants.screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
