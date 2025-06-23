import 'dart:math';

import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';
import '../../../../config/appColors.dart';
import '../../../../config/appConstants.dart';
import '../../../core/shared_widget/elevatedButton.dart';

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
        isValid =
            widget.controller.text.isNotEmpty; // التحقق من أن النص ليس فارغًا
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
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(AppConstants.screenWidth * 0.06),
              child: elevated_button(
                valid: isValid,
                onPressed: () {
                  if (isValid) widget.sendOTP();
                },
                buttonName: LocaleKeys.buttons_name_next.tr(),
              ),
            ),


            dont_have_suadinNumber(),
            SizedBox(
              height: AppConstants.screenHeight * 0.07, // تغيير المسافة
            ),
          ],
        ),
      ),
    );
  }

  Widget dont_have_suadinNumber(){
   return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          Text(
            LocaleKeys.auth_no_saudi_number.tr(),
            style: TextStyle(fontSize: AppConstants.screenWidth*0.046,
                color: Colors.black87),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.signUp);
              // Action: navigate to email registration
            },
            child: Text(
              LocaleKeys.auth_register_with_email.tr(),
              style: TextStyle(
                fontSize: AppConstants.screenWidth*0.045,
                color:AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }


  textFormField() {
    return Center(
      child: SizedBox(
        width: AppConstants.screenWidth * 0.7,
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.errors_please_enter_your_number.tr();
            }

            final regex = RegExp(r'^05\d{8}$');
            if (!regex.hasMatch(value)) {
              return LocaleKeys.errors_please_enter_a_valid_saudi_phone_number_
                  .tr();
            }

            return null;
          },
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.screenWidth * 0.08,
          ),
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: "0501234567",
            // تعديل هنا فقط
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.screenWidth * 0.08,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: AppConstants.screenHeight * 0.015,
            ),
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
          LocaleKeys.auth_enter_mobile_number.tr(),
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
            width: AppConstants.screenWidth * 0.1,
            // تعديل العرض ليكون مرن
            height: AppConstants.screenHeight * 0.025,
            // تعديل الارتفاع ليكون مرن
            shape: Rectangle(),
          ),
          SizedBox(width: AppConstants.screenWidth * 0.02), // تعديل المسافة
          Text(
            "+966",
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.04,
              // تعديل الحجم ليكون مرن
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
