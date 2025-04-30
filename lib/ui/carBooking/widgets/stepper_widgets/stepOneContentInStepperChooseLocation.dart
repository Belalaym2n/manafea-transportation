import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

import '../../../../config/appConstants.dart';

class BuildStepOneContentInStepperChooseLocation extends StatefulWidget {
    BuildStepOneContentInStepperChooseLocation({super.key,

    required this.selectedLocation,
    required this.changeLocation,

    });
String selectedLocation;
Function(String) changeLocation;
  @override
  State<BuildStepOneContentInStepperChooseLocation> createState() =>
      _BuildStepOneContentInStepperChooseLocationState();
}

class _BuildStepOneContentInStepperChooseLocationState
    extends State<BuildStepOneContentInStepperChooseLocation> {
  bool isExpanded = false;
   List<String> locations = [
    "الرياض", "جدة", "مكة", "المدينة المنورة",
    "الدمام", "الخبر", "الطائف", "بريدة",
    "أبها", "حائل", "تبوك", "ينبع",
    "القصيم", "جازان", "نجران", "الباحة"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Please Choose Your Location",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.02),

        // Container الرئيسي
        showSelectedLocation(),
        selectedLocationWidget(),
        // القائمة المنسدلة
        SizedBox(height: AppConstants.screenHeight * 0.02),
      ],
    );
  }

 Widget showSelectedLocation(){
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: isExpanded == true
              ? const BorderRadius.only(
              topLeft: Radius.circular(
                10,
              ),
              topRight: Radius.circular(
                10,
              ))
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
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedLocation,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              isExpanded
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_circle,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedLocationWidget() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? locations.length * 50.0 : 0,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      curve: Curves.easeInOut,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            bool isSelected = locations[index] == widget.selectedLocation;
            return GestureDetector(
              onTap: () {
                widget.changeLocation(locations[index]);

                Future.delayed(Duration(milliseconds: 300), () {
                  setState(() {
                    isExpanded = false;
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                  scale: isSelected ? 1.05 : 1.0, // Animation for click effect
                  child: Text(
                    locations[index],
                    style: TextStyle(
                      fontSize: 16,
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
