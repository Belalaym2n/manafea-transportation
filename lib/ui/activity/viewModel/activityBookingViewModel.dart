import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/activity/connector/activityConnector.dart';

import '../../../data/repositories/activity/getActivitySupabseRepo.dart';
import '../../../data/repositories/orderRepo/requestOrderRepo.dart';
import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../core/shared_widget/stepper_widget.dart';

class ActivityBookingViewModel extends BaseViewModel<ActivityConnector> {
  int index = 0;
  int _peopleCount = 1;
  bool _orderIsDone = false;
  bool _isLoading = false;
  String _name = '';
  String _phoneNumber = '';

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  bool get isLoading => _isLoading;

  bool get orderIsDone => _orderIsDone;
  int? totalPrice;
  ActivityModel activityModel;

  int get peopleCount => _peopleCount;
  String dateString = LocaleKeys.activity_screen_click_to_select.tr();
  DateTime focusedDateCheckOut = DateTime.now().add(Duration(days: 1));
  RequestOrderRepo requestOrderRepo;

  ActivityBookingViewModel(this.activityModel, this.requestOrderRepo);

  //stepper
  onStepContinue({
    String? phoneNumber,
    String? name,
  }) async {
    bool isDataValid = checkDateValidation();
    if (!isDataValid) {
      return connector!.onError(LocaleKeys.errors_please_choose_date.tr());
    }
    bool isValidDataBooking = await validBookingData(
      stepIndex: 2,
      name: name,
      phoneNumber: phoneNumber,
    );

    if (!isValidDataBooking) {
      return connector!.onError
        (LocaleKeys.errors_name_and_number_must_not_be_empty.tr())

;    }
    if (index == 3) {
      try {

        await requestOrder();
        return;
      } catch (e) {
        print(e.toString());
        return connector?.onError(e.toString());
      }
    }
    _moveToNextStep();
  }
  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }
  //stepOneLogic
  changeSelectDate(DateTime dateTime) {
    focusedDateCheckOut = dateTime;
    dateString = DateFormat('dd/MM/yyyy').format(dateTime);
    notifyListeners();
  }

  bool checkDateValidation() {
    if (dateString == LocaleKeys.activity_screen_click_to_select.tr()) {
      return false;
    }
    return true;
  }
  // step TwoLogic

  void increasePeopleCount() {
     _peopleCount++;
    calculatePrice();
    print(totalPrice);
    print(peopleCount);
    notifyListeners();
  }

  void calculatePrice() {
    totalPrice = activityModel.itemPricing * _peopleCount; // حساب السعر الإجمالي
    notifyListeners();
  }

  void minusPeopleCount() {
    if (_peopleCount > 1) _peopleCount--;
    calculatePrice();
    print(totalPrice);
    notifyListeners();
  }

  // step two
  Future<bool> validBookingData(
      {String? phoneNumber, String? name, int? stepIndex}) async {
    if (index == stepIndex) {
      if ((phoneNumber?.trim().isEmpty ?? true) ||
          (name?.trim().isEmpty ?? true)) {
        return false;
      } else {
        await setUserDate(phoneNumber: phoneNumber ?? "", name: name ?? '');
        print(" nsf $_name");
        print(" nsf $_phoneNumber");
      }
    }
    return true;
  }
  setUserDate({
    required String phoneNumber,
    required String name,
  }) async {
    _phoneNumber = phoneNumber;
    _name = name;
    notifyListeners();
  }

  // step Three

  requestOrder() async {
    try {
      final DateFormat formatter = DateFormat('h:mm a');
      setLoading(true);
      String id =await SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.userId);

      final order = RequestActivityOrderBuilder()
          .setName(_name)
          .setActivityName(activityModel.itemName)
          .setPeopleCount(12)
          .setService("Activity")
          .setPhoneNumber(_phoneNumber)
          .setOrderDate(dateString)
          .setPrice(totalPrice?.toDouble() ?? activityModel.itemPricing.toDouble())
          .setUserId(id)
          .setStatus("Pending")
          .setTime(formatter.format(DateTime.now()))
          .build();

      await requestOrderRepo.requestOrder(requestOrder: order);
      await setLoading(false);
      _orderIsDone = true;
      notifyListeners();
      print("after");
    } catch (e) {
      setLoading(false);
      print(e.toString());
      return connector!.onError(e.toString());
    }
  }


  // common function in steps
  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _moveToNextStep() {
    if (index < 3) {
      index += 1;
    }
    notifyListeners();
  }






  List<Step> get steps {
    return [
      buildStep(
        colorIndex: index > 0,
        isActive: index > 0,
        content:
            connector?.buildStepOneContentChooseDayBooking() ?? Container(),
        isCurrentStep: index == 0,
        tittle: LocaleKeys.activity_screen_step_choose_booking_day.tr(),
      ),
      buildStep(
        colorIndex: index > 1,
        isActive: index > 1,
        content: connector!.buildStepTwoContentPeopleCount(),
        isCurrentStep: index == 1,
        tittle:LocaleKeys.activity_screen_people_count.tr(),
      ),
      buildStep(
        colorIndex: index > 2,
        isActive: index > 2,
        content: connector!.buildStepThreeContentConfirmData(),
        isCurrentStep: index == 3,
        tittle: LocaleKeys.car_screen_confirm_booking_info.tr(),
      ),
      buildStep(
        colorIndex: index > 3,
        isActive: index > 3,
        content: connector!.buildStepFourContentBooking(),
        isCurrentStep: index == 4,
        tittle: LocaleKeys.car_screen_confirm_booking.tr(),
      ),
    ];
  }
}
