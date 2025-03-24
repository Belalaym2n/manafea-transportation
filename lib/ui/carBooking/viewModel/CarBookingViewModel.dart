import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/carBooking/connector/carBookingConnector.dart';

import '../../core/shared_widget/stepper_widget.dart';

class CarBookingViewModel extends BaseViewModel<CarBookingConnector>{
  int index = 0;


  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }

  void _moveToNextStep() {
    index += 1;
    notifyListeners();
  }
  void onStepContinue() {
    print(index);
    _moveToNextStep();
  }

  List<Step> get steps {
    return [
      buildStep(
        colorIndex: index > 0,
        isActive: index > 0,
        content: connector?.stepOneContentInStepperChooseLocation()
            ?? Container(),
        isCurrentStep: index == 0,
        tittle: 'Choose Your Location',
      ),



      buildStep(
        colorIndex: index > 1,
        isActive: index > 1,
        content: connector!.stepTwoContentInStepperChooseCheckInAndCheckOut(),
        isCurrentStep: index == 1,
        tittle: 'Check-in / Check-out',
      ),
      buildStep(
        colorIndex: index > 2,
        isActive: index > 2,
        content: connector!.stepThreeContentInStepperConfirmUserData(),
        isCurrentStep: index == 3,
        tittle: 'Confirm Booking information ',
      ),
 
      buildStep(
        colorIndex: index > 4,
        isActive: index > 4,
        content: connector!.stepFourContentInStepperBookingButton(),
        isCurrentStep: index == 4,
        tittle: 'Confirm Booking',
      ),
    ];
  }
}