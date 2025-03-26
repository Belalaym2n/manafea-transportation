import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/activity/connector/activityConnector.dart';

import '../../core/shared_widget/stepper_widget.dart';

class ActivityBookingViewModel extends BaseViewModel<ActivityConnector> {
  int index = 0;
  int _peopleCount = 1;
  bool _orderIsDone = false;

  bool get orderIsDone => _orderIsDone;

  int get peopleCount => _peopleCount;

  void increaseRoomCount() {
    _peopleCount++;
    notifyListeners();
  }

  void minusRoomCount() {
    if (_peopleCount > 1) _peopleCount--;
    notifyListeners();
  }

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
    if (index >= steps.length - 1) {
      _orderIsDone = true;
      notifyListeners();
      return;
    }
    print(index);
    _moveToNextStep();
  }

  List<Step> get steps {
    return [
      buildStep(
        colorIndex: index > 0,
        isActive: index > 0,
        content:
            connector?.buildStepOneContentChooseDayBooking() ?? Container(),
        isCurrentStep: index == 0,
        tittle: 'Choose Your Booking Day',
      ),
      buildStep(
        colorIndex: index > 1,
        isActive: index > 1,
        content: connector!.buildStepTwoContentPeopleCount(),
        isCurrentStep: index == 1,
        tittle: ' Confirm Booking Data',
      ),
      buildStep(
        colorIndex: index > 2,
        isActive: index > 2,
        content: connector!.buildStepThreeContentConfirmData(),
        isCurrentStep: index == 3,
        tittle: 'Confirm Booking information ',
      ),
      buildStep(
        colorIndex: index > 4,
        isActive: index > 4,
        content: connector!.buildStepFourContentBooking(),
        isCurrentStep: index == 4,
        tittle: 'Confirm Booking',
      ),
    ];
  }
}
