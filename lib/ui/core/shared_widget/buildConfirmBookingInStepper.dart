import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

class ConfirmBookingInStepper extends StatefulWidget {
  final VoidCallback onStepCancel;
  final VoidCallback onStepContinue;

  const ConfirmBookingInStepper({
    Key? key,
    required this.onStepCancel,
    required this.onStepContinue,
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
          height: AppConstants.screenHeight * 0.09,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: AppConstants.screenWidth * 0.02),
                _buildButtonBooking(widget.onStepContinue),
                SizedBox(width: AppConstants.screenWidth * 0.01),
                _buildPriceText(),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        elevated_button(
          bgColor: Colors.red,
          buttonSize: Size(AppConstants.screenWidth, AppConstants.screenHeight * 0.06),
          onPressed: widget.onStepCancel,
          buttonName: "Cancel",
          valid: true,
        ),
      ],
    );
  }

  Widget _buildPriceText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "All Booking",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "25 thousand ",
          style: TextStyle(
            fontSize: 16,
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
        "Booking",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
