import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/data/repositories/orderRepo/requestOrderRepo.dart';
import 'package:manafea/domain/models/requestOrderModel.dart';
import '../../../config/base_class.dart';
import '../../../domain/models/hotelModels/requestHotelBooking.dart';
import '../../core/shared_widget/stepper_widget.dart';
import '../connector/hotelConnector.dart';

class HotelBookingViewModel extends BaseViewModel<HotelConnector> {
  int index = 0;
  int _roomCount = 1;
  double _pricePerUnit = 10.0;
  double _totalPrice = 10.0;

  String _selectedRoomType = "";
  String _phoneNumber = '';
  String _name = '';
  String _selectedCommonRoomType = "";
  bool _orderIsDone = false;
  bool _isLoading = false;
  String checkInDateString = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String checkOutDateString =
      DateFormat('dd/MM/yyyy').format(DateTime.now().add(Duration(days: 1)));
  DateTime focusedDateCheckOut = DateTime.now().add(const Duration(days: 1));
  DateTime focusedDateCheckIn = DateTime.now();

  bool get orderIsDone => _orderIsDone;

  bool get isLoading => _isLoading;

  String get selectedRoomType => _selectedRoomType;

  String get selectedCommonRoomType => _selectedCommonRoomType;

  int get totalSteps => selectedRoomType == "Common" ? 6 : 5;

  int get roomCount => _roomCount;

  double get pricePerUnit => _pricePerUnit;

  double get totalPrice => _totalPrice;

  RequestOrderRepo requestOrderRepo;

  HotelBookingViewModel(this.requestOrderRepo);

// stepper buttons
  onStepContinue({
    String? phoneNumber,
    String? name,
  }) async {
    print("index $index");
    if (index == 0 && selectedRoomType.isEmpty) {
      connector?.onError("Please choose your Room type ");
      return;
    }

    if (index == 2 && checkInDateString == checkOutDateString) {
      return connector!.onError("booking at least one day");
    }
    if (index == 3) {
      print("room $selectedRoomType");
      if ((phoneNumber?.trim().isEmpty ?? true) ||
          (name?.trim().isEmpty ?? true)) {
        print(index);
        connector?.onError("Name and Number must not be empty");
        return;
      } else {
        await setUserDate(phoneNumber: phoneNumber, name: name);
        print("phone $_phoneNumber");
      }
    }
    if (index == 4 && selectedRoomType == "Special") {
      try {
        print("Sending request...");
        await requestOrder(
          phoneNumber: phoneNumber ?? "",
          name: name ?? '',
        );

        return;
      } catch (e) {
        print(e.toString());
        return connector?.onError(e.toString());
      }
    }
    _moveToNextStep();
    print("index $index");
  }

  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }

  void _moveToNextStep() {
    if (index < totalSteps) {
      index++;
      notifyListeners();
    } else {
      print("You have reached the last step.");
    }
  }

  // step one in stepper
  void changeRoomSelected(String roomType) {
    _selectedRoomType = roomType;
    index = 0; // إعادة تعيين الخطوة
    notifyListeners();
  }

  void changeCommonRoomTypeSelected(String roomType) {
    _selectedCommonRoomType = roomType;
    notifyListeners();
  }

  // step two function in stepper
  void increaseRoomCount() {
    _roomCount++;
    calculatePrice();
    notifyListeners();
  }

  void calculatePrice() {
    _totalPrice = _pricePerUnit * _roomCount; // حساب السعر الإجمالي
    notifyListeners();
  }

  void minusRoomCount() {
    if (_roomCount > 1) _roomCount--;
    calculatePrice();
    notifyListeners();
  }

  // step three select day booking in stepper

  changeSelectCheckInDate(DateTime dateTime) {
    focusedDateCheckIn = dateTime;
    checkInDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    notifyListeners();
  }

  changeSelectCheckOutDate(DateTime dateTime) {
    focusedDateCheckOut = dateTime;
    checkOutDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    notifyListeners();
  }

  // step five user booking data

  requestOrder({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      setLoading(true);

      final order = RequestHotelBookingBuilder()
          .setName(_name)
          .setPhoneNumber(_phoneNumber)
          .setOrderDate(DateTime.now().toString())
          .setPrice(_totalPrice)
          .setUserId("userID")
          .setStatus("Pending")
          .setTime("10:00 AM")
          .setRoomType(_selectedRoomType)
          .setRoomCount(_roomCount)
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

//set user data
  setUserDate({
    String? phoneNumber,
    String? name,
  }) {
    _phoneNumber = phoneNumber ?? 'not exist ';
    _name = name ?? '';
    notifyListeners();
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  // steps
  List<Step> get steps {
    return [
      buildStep(
        colorIndex: index > 0,
        isActive: index > 0,
        content: connector?.stepOneContentInStepper() ?? Container(),
        isCurrentStep: index == 0,
        tittle: 'Choose Room Type',
      ),
      if (selectedRoomType == "Common")
        buildStep(
          colorIndex: index > 1,
          isActive: index > 1,
          content: connector!.stepTwoContentInStepperForCommonRoomType(),
          isCurrentStep: index == 1,
          // ✅ ضبط الفهرس ليكون 1 بدلاً من 2
          tittle: 'Choose Common Room Type',
        ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 2 : index > 1,
        isActive: index > 2,
        content: connector!.stepTwoContentInStepper(),
        isCurrentStep: index == 2,
        tittle: 'Room Count',
      ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 3 : index > 2,
        isActive: index > 3,
        content: connector!.stepThreeContentInStepper(),
        isCurrentStep: index == 3,
        tittle: 'Check-in / Check-out',
      ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 4 : index > 3,
        isActive: index > 4,
        content: connector!.stepFourContentInStepperUserBookingInfo(),
        isCurrentStep: index == 4,
        tittle: 'Confirm Details',
      ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 5 : index > 4,
        isActive: index > 5,
        content: connector!.stepFiveContentInStepperBookingButton(),
        isCurrentStep: index == 5,
        tittle: 'Confirm Booking',
      ),
    ];
  }
}
