import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../generated/locale_keys.g.dart'; // Make sure to import easy_localization

class ConfirmBookingInStepper extends StatefulWidget {
  final VoidCallback onStepCancel;
  final VoidCallback onStepContinue;
  String totalPrice;

  ConfirmBookingInStepper({
    Key? key,
    required this.onStepCancel,
    required this.onStepContinue,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _ConfirmBookingInStepperState createState() => _ConfirmBookingInStepperState();
}

class _ConfirmBookingInStepperState extends State<ConfirmBookingInStepper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppConstants.screenHeight * 0.1 ,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.05),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppConstants.screenWidth * 0.023),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: AppConstants.screenWidth * 0.02),
                _buildButtonBooking(widget.onStepContinue),
                SizedBox(width: AppConstants.screenWidth * 0.01),
                _buildPriceText(),
                SizedBox(width: AppConstants.screenWidth * 0.02),

              ],
            ),
          ), 
        ),
        SizedBox(height: AppConstants.screenHeight * 0.013),
        elevated_button(
          bgColor: Colors.red,
          buttonSize: Size(AppConstants.screenWidth, AppConstants.screenHeight * 0.06),
          onPressed: widget.onStepCancel,
          buttonName: LocaleKeys.confirm_booking_screen_cancel.tr(), // Use LocaleKeys
          valid: true,
        ),
        SizedBox(height: AppConstants.screenHeight * 0.043),

      ],
    );
  }

  Widget _buildPriceText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.confirm_booking_screen_all_booking.tr(), // Use LocaleKeys
          style: TextStyle(
            fontSize: AppConstants.screenWidth * 0.033,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "${widget.totalPrice}",
          style: TextStyle(
            fontSize: AppConstants.screenWidth * 0.03,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonBooking(VoidCallback onStepContinue) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: onStepContinue,
      child: Text(
         LocaleKeys.confirm_booking_screen_booking.tr(), // Use LocaleKeys
        style: TextStyle(
          fontSize: AppConstants.screenWidth * 0.05,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
