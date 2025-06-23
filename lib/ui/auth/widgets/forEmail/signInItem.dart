import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/appColors.dart';
import '../../../../config/appConstants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../routing/appRoutes.dart';
import '../../../core/shared_widget/elevatedButton.dart';
import '../../../core/shared_widget/textFormField.dart';

class SignInItem extends StatefulWidget {
    SignInItem({super.key   , required this.emailController,
    required this.signIn,
     this.isAdmin=false,
    required this.passwordController,
  });

  final TextEditingController passwordController;
  final TextEditingController emailController;
  bool isAdmin;
  final Function({required String email,
  required String password
  }) signIn;
  @override
  State<SignInItem> createState() => _SignInItemState();
}

class _SignInItemState extends State<SignInItem> {
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
    return   Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.1),
              child: Column(
                children: [
                  SizedBox(height: AppConstants.screenHeight * 0.06),
                  _buildSignInText(),
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
                  SizedBox(
                    height: AppConstants.screenHeight * 0.01,
                  ),

                  if(widget.isAdmin==false)
                  _alignForgotPassword(),
                  const Spacer(),
                  elevated_button(
                    onPressed: () {
                      isValid
                          ? widget.signIn(
                          email:
                          widget.emailController.text,
                          password:
                          widget.passwordController.text)
                          : SizedBox();
                    },
                    valid: isValid,
                    buttonName:         LocaleKeys.auth_sign_in.tr(), // "Create your account"

                  ),
                  SizedBox(
                    height: AppConstants.screenHeight * 0.02,
                  ),
                  if(widget.isAdmin==false)
                  already_have_account(),
                  SizedBox(
                    height: AppConstants.screenHeight * 0.05,
                  )

            ]));
  }

  Widget _alignForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.forgetPassword);
         },
        child: Text(
          LocaleKeys.auth_auth_forgot_password.tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.screenWidth*0.038,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
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
              Navigator.pushNamed(context, AppRoutes.login);
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

  _buildSignInText() {
    return Text(
        LocaleKeys.auth_sign_in.tr(), // "Create your account"
        style: TextStyle(
          color: Colors.black,
          fontSize: AppConstants.screenWidth * 0.07,
          fontWeight: FontWeight.bold,
        ));
  }}

