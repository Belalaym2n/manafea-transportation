import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';

import '../../../config/appColors.dart';
import '../../../generated/locale_keys.g.dart';

error_widget({
  required BuildContext context,
  required String message,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.05),
          ),
          title: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: AppConstants.screenWidth * 0.08,
              ),
              SizedBox(width: AppConstants.screenWidth * 0.02),
              Text(
                LocaleKeys.errors_error_message.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.screenWidth * 0.05,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(AppConstants.screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(AppConstants.screenWidth * 0.03),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: AppConstants.screenWidth * 0.045,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppConstants.screenWidth * 0.09),
                ),
                minimumSize: Size(AppConstants.screenWidth * 0.16,
                    AppConstants.screenHeight * 0.04),
                shadowColor: Colors.red.withOpacity(0.5),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.buttons_name_ok.tr(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      });
}
