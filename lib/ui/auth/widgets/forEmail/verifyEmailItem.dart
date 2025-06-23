import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/auth/view/personalDetails/personalDetailedView.dart';

class VerifyEmailItem extends StatefulWidget {
  VerifyEmailItem(
      {super.key, required this.verifyEmail, required this.resendVerification});

  Function verifyEmail;
  Function resendVerification;

  @override
  State<VerifyEmailItem> createState() => _VerifyEmailItemState();
}

class _VerifyEmailItemState extends State<VerifyEmailItem> {
  @override
  Widget build(BuildContext context) {
    final width = AppConstants.screenWidth;
    final height = AppConstants.screenHeight;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: height * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: width * 0.2,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: height * 0.025),
                  Text(
                    LocaleKeys.auth_verification_sent_message.tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.04,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        widget.verifyEmail();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                      ),
                      icon: const Icon(Icons.verified, color: Colors.white),
                      label: Text(
                        LocaleKeys.auth_verified_button.tr(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TextButton(
                    onPressed: () {
                      widget.resendVerification();
                    },
                    child: Text(
                      LocaleKeys.auth_resend_button.tr(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.037,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
