import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/auth/view/withEmail/signUpWithEmail.dart';

import '../../../../config/appColors.dart';
import '../../../../config/appConstants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../routing/appRoutes.dart';
import '../../../core/shared_widget/elevatedButton.dart';
import '../../../core/shared_widget/textFormField.dart';

class SignUpItem extends StatefulWidget {
    SignUpItem({
    super.key,
    required this.emailController,
    required this.createAccount,
    required this.passwordController,
  });

  final TextEditingController passwordController;
  final TextEditingController emailController;
    final Function({required String email,
    required String password
    }) createAccount;

  @override
  State<SignUpItem> createState() => _SignUpItemState();
}

class _SignUpItemState extends State<SignUpItem> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    updateValidation();

    widget.emailController.addListener(updateValidation);
    widget.passwordController.addListener(updateValidation);
  }

  void updateValidation() {
    setState(() {
      isValid = widget.emailController.text.isNotEmpty &&
          widget.passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.1),
          child: Column(
    children: [
      SizedBox(height: AppConstants.screenHeight * 0.06),
      _buildEnterNumberText(),
      SizedBox(height: AppConstants.screenHeight * 0.06),
      buildTextFormFieldForAuth(
        icon: Icons.mark_email_read_outlined,
        controller: widget.emailController,
        hint: LocaleKeys.auth_auth_email_hint.tr(),
        errorValidator:
            LocaleKeys.errors_please_enter_firstname_and_lastname.tr(),
        screenWidth: AppConstants.screenWidth,
      ),
      SizedBox(height: AppConstants.screenHeight * 0.01),
      buildTextFormFieldForAuth(
        icon: Icons.vpn_key_outlined,
        controller: widget.passwordController,
        hint: LocaleKeys.auth_auth_password_hint.tr(),
        errorValidator:
            LocaleKeys.errors_please_enter_firstname_and_lastname.tr(),
        screenWidth: AppConstants.screenWidth,
      ),
      const Spacer(),
      elevated_button(
        onPressed: () {
          isValid
              ? widget.createAccount(
              email:
              widget.emailController.text,
                  password:
                  widget.passwordController.text)
              : SizedBox();
        },
        valid: isValid,
        buttonName: LocaleKeys.buttons_name_next.tr(),
      ),
      SizedBox(
        height: AppConstants.screenHeight * 0.02,
      ),
      already_have_account(),
      SizedBox(
        height: AppConstants.screenHeight * 0.05,
      )
    ],

        ));
  }

  Widget already_have_account() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          Text(
            LocaleKeys.auth_have_account_question.tr(),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.signInScreen);
              // Action: navigate to email registration
            },
            child: Text(
              LocaleKeys.auth_sign_in.tr(),
              style: TextStyle(
                fontSize: AppConstants.screenWidth * 0.045,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildEnterNumberText() {
    return Text(
        LocaleKeys.auth_auth_create_account_title.tr(), // "Create your account"
        style: TextStyle(
          color: Colors.black,
          fontSize: AppConstants.screenWidth * 0.07,
          fontWeight: FontWeight.bold,
        ));
  }
}
