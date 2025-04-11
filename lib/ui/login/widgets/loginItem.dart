import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';
import '../../../routing/appRoutes.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../../core/shared_widget/textFormField.dart';

class LoginItem extends StatefulWidget {
  LoginItem({super.key, required this.controller, required this.sendOTP});
  TextEditingController controller;
  Function sendOTP;

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool isLoading = false;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        isValid = widget.controller.text.isNotEmpty; // التحقق من أن النص ليس فارغًا
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: _buildEnterNumberText()),
            SizedBox(height: AppConstants.screenHeight * 0.04), // تغيير المسافة
            _buildSaudiFlag(),
            SizedBox(height: AppConstants.screenHeight * 0.07), // تغيير المسافة
            textFormField(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(AppConstants.screenWidth * 0.04), // تغيير padding
              child: elevated_button(
                valid: isValid,
                onPressed: () {
                  if (isValid) widget.sendOTP();
                },
                buttonName: "Next",
              ),
            ),
            SizedBox(
              height: AppConstants.screenHeight * 0.04, // تغيير المسافة
            ),
          ],
        ),
      ),
    );
  }

  textFormField() {
    return Center(
      child: SizedBox(
        width: AppConstants.screenWidth * 0.7, // تعديل العرض ليكون أكثر مرونة
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.screenWidth * 0.08, // التعديل ليكون مرن
          ),
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: "0598765432",
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.screenWidth * 0.08, // التعديل ليكون مرن
            ),
            contentPadding: EdgeInsets.symmetric(vertical: AppConstants.screenHeight * 0.015), // تغيير padding
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lightBlack,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildEnterNumberText() {
    return Column(
      children: [
        SizedBox(height: AppConstants.screenHeight * 0.05), // تعديل المسافة
        Text(
          'Enter Mobile Number',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: AppConstants.screenWidth * 0.07, // تعديل الحجم ليتناسب
          ),
        ),
      ],
    );
  }

  _buildSaudiFlag() {
    return Container(
      height: AppConstants.screenHeight * 0.05, // تعديل الارتفاع ليكون مرن
      width: AppConstants.screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black54),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: AppConstants.screenWidth * 0.03), // تعديل المسافة
          CountryFlag.fromCountryCode(
            'SA',
            width: AppConstants.screenWidth * 0.1, // تعديل العرض ليكون مرن
            height: AppConstants.screenHeight * 0.025, // تعديل الارتفاع ليكون مرن
            shape: Rectangle(),
          ),
          SizedBox(width: AppConstants.screenWidth * 0.02), // تعديل المسافة
          Text(
            "+966",
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.04, // تعديل الحجم ليكون مرن
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
