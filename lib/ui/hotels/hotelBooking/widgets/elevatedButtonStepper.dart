import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../config/appColors.dart';


class ElevatedButtonStepper extends StatelessWidget {
  ElevatedButtonStepper({
    super.key,
    required this.onStepContinue,
    required this.onStepCancel,
  });

  Function(
    String? phoneNumber,
    String? name,
  ) onStepContinue;
  Function onStepCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                AppColors.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        AppConstants.screenWidth * 0.03),
              ),
            ),
          ),
          onPressed: () => onStepContinue(null, null),
           child: Text(
            LocaleKeys.buttons_name_continue.tr(),
            style: TextStyle(
                color: Colors.white,
                fontSize: AppConstants.screenWidth * 0.04),
          ),
        ),
        SizedBox(width: AppConstants.screenWidth * 0.02),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.screenWidth * 0.03),
              ),
            ),
          ),
          onPressed: () => onStepCancel(),
          child: Text(
            LocaleKeys.buttons_name_back.tr(),
            style: TextStyle(
                color: Colors.white,
                fontSize: AppConstants.screenWidth * 0.03),
          ),
        )
      ],
    );
  }
}
