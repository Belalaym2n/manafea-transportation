import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key, required this.verifyNumber});

  Function(String) verifyNumber;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // 360
    final screenHeight = MediaQuery.of(context).size.height; // 776

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.088,  // تقريبًا 32 على 360
            vertical: screenHeight * 0.113,   // تقريبًا 88 على 776
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(screenWidth),
                SizedBox(height: screenHeight * 0.113), // 88
                _buildPinCodeFields(context, screenWidth),
                SizedBox(height: screenHeight * 0.077), // 60
                _buildVerifyButton(context, screenWidth, screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context, double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () async {
          widget.verifyNumber(otpCode ?? '');
        },
        child: Text(
          'Verify',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.044, // 16
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(screenWidth * 0.305, screenHeight * 0.064), // 110x50
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.016), // تقريبًا 6
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeFields(BuildContext context, double screenWidth) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(screenWidth * 0.014), // 5
        fieldHeight: screenWidth * 0.14, // 50 على 360
        fieldWidth: screenWidth * 0.11, // 40 على 360
        borderWidth: 1,
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.primaryColor,
        inactiveFillColor: Colors.white,
        activeFillColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        selectedFillColor: Colors.white,
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: screenWidth * 0.055, // تقريبًا 20
        fontWeight: FontWeight.bold,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onChanged: (value) {},
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
      },
    );
  }

  Widget _buildIntroTexts(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify your phone number',
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.066, // 24
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.083), // تقريبًا 30 على 360
        Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.0055), // 2
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.05, // 18
                height: 1.4,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '+966 676 66 677',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
