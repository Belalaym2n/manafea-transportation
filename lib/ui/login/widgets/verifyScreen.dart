import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../config/appConstants.dart';

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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntroTexts(),
              const SizedBox(height: 88),
              _buildPinCodeFields(context),
              const SizedBox(height: 60),
              _buildVerifyButton(context),
            ],
          ),
        ),
      ),
    ));
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.3), // خلفية شفافة للحجب
      barrierDismissible: false, // يمنع إغلاقه بالضغط خارجه
      context: context,
      builder: (context) {
        return const LoadingWidget();
      },
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () async {

            widget.verifyNumber(otpCode ?? '');

          },
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
        child: PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,

        activeColor: AppColors.primaryColor,
        //4
        inactiveColor: AppColors.primaryColor,
        //4
        inactiveFillColor: Colors.white,
        activeFillColor: AppColors.primaryColor,
        //4
        selectedColor: AppColors.primaryColor,
        selectedFillColor: Colors.white,
      ),
      textStyle: TextStyle(
        color: Colors.white, // استبدل باللون الذي تريده
        fontSize: 20, // يمكنك تعديل الحجم
        fontWeight: FontWeight.bold,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onChanged: (value) {
        print("Completed");
      },
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
      },
    ));
  }

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your phone number',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style: TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
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
