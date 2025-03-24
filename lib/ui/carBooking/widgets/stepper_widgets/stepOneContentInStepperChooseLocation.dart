import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

import '../../../../config/appConstants.dart';

class BuildStepOneContentInStepperChooseLocation extends StatefulWidget {
  const BuildStepOneContentInStepperChooseLocation({super.key});

  @override
  State<BuildStepOneContentInStepperChooseLocation> createState() =>
      _BuildStepOneContentInStepperChooseLocationState();
}

class _BuildStepOneContentInStepperChooseLocationState
    extends State<BuildStepOneContentInStepperChooseLocation> {
  bool isExpanded = false;
  String selectedLocation = "Location";
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
        GestureDetector(
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
                  selectedLocation,
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
        ),

        // القائمة المنسدلة
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? locations.length * 50.0 : 0,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  10,
                ),
                bottomLeft: Radius.circular(
                  10,
                )),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                bool isSelected = locations[index] == selectedLocation;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLocation = locations[index];
                      isExpanded = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    color: isSelected ? AppColors.primaryColor : Colors.white,
                    child: Text(
                      locations[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.02),
      ],
    );
  }
}
