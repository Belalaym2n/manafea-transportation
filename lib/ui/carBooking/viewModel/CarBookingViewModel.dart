import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/ui/carBooking/connector/carBookingConnector.dart';

import '../../../data/repositories/orderRepo/requestOrderRepo.dart';
import '../../../domain/models/carModels/addCarModel.dart';
import '../../core/shared_widget/stepper_widget.dart';

class CarBookingViewModel extends BaseViewModel<CarBookingConnector> {
  int index = 0;
  // for step one
  String _selectedLocation = 'Click tp Select';
  String get selectedLocation => _selectedLocation;

// paramterrs for step two
  String deliveryDateString = "Select Date";
  String receiptDateString = "Select Date";
  DateTime focusedDateReceipt = DateTime.now();
  DateTime focusedDateDelivery = DateTime.now().subtract(Duration(days: 1));

// parammetter for step three
  String get name => _name;
  String _phoneNumber = '';
  String _name = '';
  String get phoneNumber => _phoneNumber;
// all price

  int allPrice=0;
  // for loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _orderIsDone = false;
  bool get orderIsDone => _orderIsDone;

  // for constructor
  AddCarModel car;
   RequestOrderRepo requestOrderRepo;

  CarBookingViewModel(this.car,this.requestOrderRepo);

  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }


  onStepContinue({
    String? phoneNumber,
    String? name,
  }) async {
    bool isLocationValid = stepOneValidLocation();
    bool isDatsValid = validDatesSelected();
    bool isValidDataBooking = await validBookingData(
      name: name,
      phoneNumber: phoneNumber,
    );

    if (isLocationValid == false) {
      return connector!
          .onError("Please Choose location you want ro receive car");
    }
    if (isDatsValid == false) {
      return connector!.onError("booking at least one day");
    }
    if (isValidDataBooking == false) {
      return connector?.onError("Name and Number must not be empty");
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
    if (index == 0 && _selectedLocation == 'Click tp Select') {
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
        index == 1 &&
            deliveryDateString == "Select Date") {
      return false;
    }

    return true;
  }
// step three confirmBooking

  Future<bool> validBookingData({String? phoneNumber, String? name}) async {
    if (index == 2) {
      if ((phoneNumber?.trim().isEmpty ?? true) ||
          (name?.trim().isEmpty ?? true)) {
        return false;
      } else {
        await setUserDate(phoneNumber: phoneNumber ?? "", name: name ?? '');
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




  // step four confirm order
  requestOrder() async {
    try {
      print("after");

      final DateFormat formatter = DateFormat('h:mm a');
      setLoading(true);
      final order = RequestCarBookingOrderBuilder()
          .setName(_name)
          .setCarName(car.itemName)
           .setService("Car")
          .setPhoneNumber(_phoneNumber)
          .setOrderDate(formatter.toString())
          .setPrice( allPrice.toDouble())
          .setDeliveryDate(deliveryDateString)
           .setReceiptDate(receiptDateString)
      .setDeliveryLocation(selectedLocation)
           .setUserId("userID")
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

  // calculate all price
  int calculateStayDuration(
       ) {
    final normalizedCheckIn =
    DateTime(focusedDateDelivery.year, focusedDateDelivery.month, focusedDateDelivery.day);
    final normalizedCheckOut =
    DateTime(focusedDateReceipt.year, focusedDateReceipt.month, focusedDateReceipt.day);
    final duration = normalizedCheckOut.difference(normalizedCheckIn);
    int days = duration.inDays;

    print(duration);
    print(days);

    if (receiptDateString=='Select Date' ){
      days=0;
      notifyListeners();
    }

    return days;
  }


  calculateAllPrice(){
    int allDays=calculateStayDuration();
    print("allDays $allDays");
    print("all price${car.itemPricing}");
    allPrice=car.itemPricing*allDays;

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
        tittle: 'Choose Your Location',
      ),
      buildStep(
        colorIndex: index > 1,
        isActive: index > 1,
        content: connector!.stepTwoContentInStepperChooseCheckInAndCheckOut(),
        isCurrentStep: index == 1,
        tittle: 'Receipt / Delivery',
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
