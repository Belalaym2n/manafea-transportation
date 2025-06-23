import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';

import '../../../../config/appColors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../core/shared_widget/elevatedButton.dart';
import '../../../core/shared_widget/textFormField.dart';

class ForgetPasswordItem extends StatefulWidget {
  ForgetPasswordItem(
      {super.key, required this.email, required this.forgetPassword});

  TextEditingController email;
  Function({required String email}) forgetPassword;

  @override
  State<ForgetPasswordItem> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordItem> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    updateValidation();

    widget.email.addListener(updateValidation);
  }

  void updateValidation() {
    setState(() {
      isValid = widget.email.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.screenWidth * 0.051),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppConstants.screenHeight * 0.1),
          // Icon or Illustration
          Center(
            child: Icon(
              Icons.lock_reset_rounded,
              size: AppConstants.screenWidth * 0.25,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: AppConstants.screenHeight * 0.02),
          // Title and Instructions
          Center(
            child: Text(
              LocaleKeys.auth_auth_forgot_password.tr(),
              style: TextStyle(
                fontSize: AppConstants.screenWidth * 0.056,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: AppConstants.screenHeight * 0.01),
          Center(
            child: Text(
         LocaleKeys.auth_auth_forgot_password_description.tr(),

              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppConstants.screenWidth * 0.04,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(height: AppConstants.screenHeight * 0.05),
          // Email Input Field
          buildTextFormFieldForAuth(
            icon: Icons.vpn_key_outlined,
            controller: widget.email,
            hint: LocaleKeys.auth_auth_email_hint.tr(),
            errorValidator:
                LocaleKeys.errors_please_enter_firstname_and_lastname.tr(),
            screenWidth: AppConstants.screenWidth,
          ),
          SizedBox(height: AppConstants.screenHeight * 0.04),

          elevated_button(
              valid: isValid,
              onPressed: () {
                isValid ? widget.forgetPassword(
                    email:
                    widget.email.text) : const SizedBox();
              },
              buttonName: LocaleKeys.auth_auth_reset_password_button.tr()),
          SizedBox(height: AppConstants.screenHeight * 0.021),
          // Back to Login
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.auth_auth_back_to_login.tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: AppConstants.screenWidth * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
