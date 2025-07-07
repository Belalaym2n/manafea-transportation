import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/carBooking/connector/carBookingConnector.dart';

import '../../../data/repositories/orderRepo/requestOrderRepo.dart';
import '../../../domain/models/carModels/addCarModel.dart';
import '../../core/shared_widget/stepper_widget.dart';

class CarBookingViewModel extends BaseViewModel<CarBookingConnector> {
  int index = 0;

  // for step one
  String _selectedLocation = LocaleKeys.car_screen_select_location_prompt.tr();

  String get selectedLocation => _selectedLocation;

// paramterrs for step two
  String deliveryDateString = LocaleKeys.hotelsScreen_select_Date.tr();
  String receiptDateString = LocaleKeys.hotelsScreen_select_Date.tr();
  DateTime focusedDateReceipt =
  DateTime.now().add(const Duration(days: 0));
  DateTime focusedDateDelivery = DateTime.now().add(const Duration(days: 1));

// parammetter for step three
  String get name => _name;
  String _phoneNumber = '';
  String _address = '';
  String _name = '';

  String get phoneNumber => _phoneNumber;

  String get address => _address;

// all price

  int allPrice = 0;

  // for loading
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _orderIsDone = false;

  bool get orderIsDone => _orderIsDone;

  // for constructor
  CarModel car;
  RequestOrderRepo requestOrderRepo;

  CarBookingViewModel(this.car, this.requestOrderRepo);

  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }

  onStepContinue({
    String? phoneNumber,
    String? name,
    String? address,
  }) async {
    bool isLocationValid = stepOneValidLocation();
    bool isDatsValid = validDatesSelected();
    bool isValidDataBooking = await validBookingData(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
    );

    if (isLocationValid == false) {
      return connector!.onError(
          LocaleKeys.errors_please_choose_location_you_want_ro_recei.tr());
    }
    if (isDatsValid == false) {
      return connector!
          .onError(LocaleKeys.errors_booking_at_least_one_day.tr());
    }
    if (isValidDataBooking == false) {
      return connector
          ?.onError(LocaleKeys.errors_name_and_number_must_not_be_empty.tr());
    }

    if (index == 3) {
      try {
        await requestOrder();
        return;
      } catch (e) {
        print(e.toString());
        return connector?.onError(e.toString());
      }
    }
    print(index);
    _moveToNextStep();
  }

// step one logic
  bool stepOneValidLocation() {
    if (index == 0 &&
        _selectedLocation ==
            LocaleKeys.car_screen_select_location_prompt.tr()) {
      return false;
    }
    return true;
  }

  changeSelectedLocation(String location) {
    _selectedLocation = location;
    print(_selectedLocation);

    notifyListeners();
  }

// step two logic
  changeSelectCheckInDate(DateTime dateTime) {
    focusedDateDelivery = dateTime;
    deliveryDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    receiptDateString = 'Select Date';

    notifyListeners();
  }

  changeSelectCheckOutDate(DateTime dateTime) {
    focusedDateReceipt = dateTime;
    receiptDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    notifyListeners();
  }

  bool validDatesSelected() {
    if (index == 1 && receiptDateString == 'Select Date' ||
        index == 1 && deliveryDateString == "Select Date") {
      return false;
    }if (index == 1 && receiptDateString == deliveryDateString) {
      return false;
    }

    return true;
  }

// step three confirmBooking

  Future<bool> validBookingData(
      {String? phoneNumber, String? name, String? address}) async {
    if (index == 2) {
      if ((phoneNumber?.trim().isEmpty ?? true) ||
          (address?.trim().isEmpty ?? true) ||
          (name?.trim().isEmpty ?? true)) {
        return false;
      } else {
        await setUserDate(
            address: address ?? "",
            phoneNumber: phoneNumber ?? "",
            name: name ?? '');
      }
    }
    return true;
  }

  setUserDate({
    required String phoneNumber,
    required String name,
    required String address,
  }) async {
    _phoneNumber = phoneNumber;
    _name = name;
    _address = address;
    notifyListeners();
  }

  // step four confirm order
  requestOrder() async {
    try {
      print("after");

      String id = await SharedPreferencesHelper.getData(
          SharedSharedPreferencesKeys.userId);

      final DateFormat formatterTime = DateFormat('h:mm a');
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('dd/MM/yyyy').format(now);
      setLoading(true);
      final order = RequestCarBookingOrderBuilder()
          .setName(_name)
          .setCarName(car.itemName)
          .setService("Car")
          .setPhoneNumber(_phoneNumber)
          .setOrderDate(formattedDate.toString())
          .setPrice(allPrice.toDouble())
          .setDeliveryDate(deliveryDateString)
          .setReceiptDate(receiptDateString)
          .setDeliveryLocation(selectedLocation + _address)
          .setUserId(id)
          .setStatus("Pending")
          .setTime(formatterTime.format(DateTime.now()))
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

  // calculate all price
  int calculateStayDuration() {
    final normalizedCheckIn = DateTime(focusedDateDelivery.year,
        focusedDateDelivery.month, focusedDateDelivery.day);
    final normalizedCheckOut = DateTime(focusedDateReceipt.year,
        focusedDateReceipt.month, focusedDateReceipt.day);
    final duration = normalizedCheckOut.difference(normalizedCheckIn);
    int days = duration.inDays;

    print(duration);
    print(days);

    if (receiptDateString == 'Select Date') {
      days = 0;
      notifyListeners();
    }

    return days;
  }

  calculateAllPrice() {
    int allDays = calculateStayDuration();
    print("allDays $allDays");
    print("all price${car.itemPricing}");
    allPrice = car.itemPricing * allDays;

    print(allPrice);
  }

// common function in steps
  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _moveToNextStep() {
    index += 1;
    notifyListeners();
  }

  List<Step> get steps {
    return [
      buildStep(
        colorIndex: index > 0,
        isActive: index > 0,
        content:
            connector?.stepOneContentInStepperChooseLocation() ?? Container(),
        isCurrentStep: index == 0,
        tittle: LocaleKeys.car_screen_choose_location.tr(),
      ),
      buildStep(
        colorIndex: index > 1,
        isActive: index > 1,
        content: connector!.stepTwoContentInStepperChooseCheckInAndCheckOut(),
        isCurrentStep: index == 1,
        tittle: LocaleKeys.car_screen_receipt_delivery.tr(),
      ),
      buildStep(
        colorIndex: index > 2,
        isActive: index > 2,
        content: connector!.stepThreeContentInStepperConfirmUserData(),
        isCurrentStep: index == 3,
        tittle: LocaleKeys.car_screen_confirm_booking_info.tr(),
      ),
      buildStep(
        colorIndex: index > 4,
        isActive: index > 4,
        content: connector!.stepFourContentInStepperBookingButton(),
        isCurrentStep: index == 4,
        tittle: LocaleKeys.car_screen_confirm_booking.tr(),
      ),
    ];
  }
}
