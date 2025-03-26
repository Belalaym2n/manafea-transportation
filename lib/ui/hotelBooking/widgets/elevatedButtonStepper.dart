import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';


import '../../../config/appColors.dart';

class ElevatedButtonStepper extends StatelessWidget {

  ElevatedButtonStepper({
    super.key,
    required this.onStepContinue,
    required this.onStepCancel,

  });

  Function onStepContinue;
  Function onStepCancel;



  @override
  Widget build(BuildContext context) {
return
        Row(
      children: [

            ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(AppColors.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AppConstants.screenWidth * 0.03),
              ),
            ),
          ),
          onPressed: () => onStepContinue(),
          child: Text(
         "Continue" ,
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
                borderRadius: BorderRadius.circular(
                    AppConstants.screenWidth * 0.03),
              ),
            ),
          ),
          onPressed: () => onStepCancel(),
          child: Text(
            "Cancel",
            style: TextStyle(
                color: Colors.white,
                fontSize: AppConstants.screenWidth * 0.03),
          ),
        )

      ],
    );
  }
}
