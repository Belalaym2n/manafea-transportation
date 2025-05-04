import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../config/appColors.dart';


class ElevatedButtonStepperBooking extends StatelessWidget {
  ElevatedButtonStepperBooking({
    super.key,
    required this.onStepContinue,
    required this.onStepCancel,
  });

  Function(

      )onStepContinue;
  Function onStepCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildElevatedButton(
            bgColor: AppColors.primaryColor,
            name: LocaleKeys.buttons_name_continue.tr(),
            onPressed:  onStepContinue
        ),
        SizedBox(width: AppConstants.screenWidth * 0.02),
        buildElevatedButton(
          bgColor: Colors.red,
          name: LocaleKeys.buttons_name_back.tr(),
          onPressed:  onStepCancel
        ) 
      ],
    );
  }

 Widget buildElevatedButton(
  {
   required Function onPressed,
   required Color bgColor,
   required String name,

}
     ){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(AppConstants.screenWidth * 0.03),
          ),
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.white,
            fontSize: AppConstants.screenWidth * 0.03),
      ),
    );
  }
}
