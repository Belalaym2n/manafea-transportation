import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';


class OrderStatusWidget extends StatelessWidget {
  final bool isSelected;
  final String statusName;

  const OrderStatusWidget({
    super.key,
    required this.isSelected,
    required this.statusName,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: AppConstants.screenWidth*0.3,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding:   EdgeInsets.symmetric(
          horizontal: AppConstants.screenWidth*0.05,
          vertical: AppConstants.screenHeight*0.01),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
          width: 2,
        ),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ]
            : [],
      ),
      child: Center(
        child: Text(
          statusName,
          style: TextStyle(
            color: isSelected ?
            Colors.white : AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.screenWidth*0.038,
          ),
        ),
      ),
    );
  }
}

