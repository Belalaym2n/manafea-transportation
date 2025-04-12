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
  String _selectedType = "";
  bool _orderIsDone = false;
  bool _isLoading = false;
  String checkInDateString =
  DateFormat('dd/MM/yyyy').format(DateTime.now());
  String checkOutDateString =
      DateFormat('dd/MM/yyyy').format(DateTime.now().add(Duration(days: 1)));
  DateTime focusedDateCheckOut = DateTime.now().add(const Duration(days: 1));
  DateTime focusedDateCheckIn = DateTime.now();

  bool get orderIsDone => _orderIsDone;

  bool get isLoading => _isLoading;

  String get selectedRoomType => _selectedRoomType;

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  String get selectedCommonRoomType => _selectedCommonRoomType;

  String get selectedType => _selectedType;

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
    bool isRoomTypeNullable = roomTypeNullable();
    bool isDatsValid = validDatesSelected(2);
    bool isValidDataBooking = await validBookingData(
        name: name, phoneNumber: phoneNumber, stepIndex: 3);
    if (isRoomTypeNullable == true) {
      return connector?.onError("Please choose your Room type ");
    }

    if (isDatsValid == false) {
      return connector!.onError("booking at least one day");
    }

    if (isValidDataBooking == false) {
      return connector?.onError("Name and Number must not be empty");
    }

    if (index == 4) {
      print("Sending request...");
      await requestOrder();
    }
    _moveToNextStep(4);
    print("index $index");
  }

  bool roomTypeNullable() {
    if (index == 0 && selectedRoomType.isEmpty) {
      return true;
    }
    return false;
  }

  bool validDatesSelected(int stepIndex) {
    if (index == stepIndex && checkInDateString == checkOutDateString) {
      return false;
    }
    return true;
  }

  Future<bool> validBookingData(
      {String? phoneNumber, String? name, int? stepIndex}) async {
    if (index == stepIndex) {
      print("room $selectedRoomType");
      if ((phoneNumber?.trim().isEmpty ?? true) ||
          (name?.trim().isEmpty ?? true)) {
        return false;
      } else {
        print(" nsf $_name");
        await setUserDate(phoneNumber: phoneNumber ?? "", name: name ?? '');
        print(" nsf $_name");
        print(" nsf $_phoneNumber");
      }
    }
    return true;
  }

  onStepContinueForCommonRoom({
    String? phoneNumber,
    String? name,
  }) async {
    print("index $index");

    if (index == 1 && _selectedCommonRoomType == '') {
      return connector!.onError("Please Choose Common Room Type");
    }
    bool isDatsValid = validDatesSelected(3);
    bool isValidDataBooking = await validBookingData(
        name: name, phoneNumber: phoneNumber, stepIndex: 4);
    if (isDatsValid == false) {
      return connector!.onError("booking at least one day");
    }
    if (isValidDataBooking == false) {
      return connector?.onError("Name and Number must not be empty");
    }
    print("Sending request...$index");

    if (index == 5) {
      try {
        print("Sending request...");
        await requestOrder();

        return;
      } catch (e) {
        print(e.toString());
        return connector?.onError(e.toString());
      }
    }
    _moveToNextStep(5);
  }

  void onStepCancel() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }

  void _moveToNextStep(int lastIndex) {
    if (index < lastIndex) {
      index++;
      notifyListeners();
      print("index $index");
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

  void chooseType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  void chooseCommonRoomType(String type) {
    _selectedCommonRoomType = type;
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

  requestOrder() async {
    try {
      final DateFormat formatter = DateFormat('h:mm a');
      setLoading(true);
      print("name $name");
      final orderBuilder = RequestHotelBookingBuilder()
          .setName(name)
          .setPhoneNumber(phoneNumber)
          .setOrderDate(DateTime.now().toString())
          .setPrice(_totalPrice)
          .setUserId("userID")
          .setStatus("Pending")
          .setTime(formatter.format(DateTime.now()))
          .setCheckIn(checkInDateString)
          .setCheckOut(checkOutDateString)
          .setRoomType(_selectedRoomType)
          .setRoomCount(_roomCount).setService("Hotel Booking");

      print("name $name");
      print(orderBuilder.name);
      if (_selectedCommonRoomType != '') {
        print("belal]");
        orderBuilder.setCommonRoomTyp(_selectedCommonRoomType);
      }

      final order = orderBuilder.build();

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
    required String phoneNumber,
    required String name,
  }) async {
    _phoneNumber = phoneNumber;
    _name = name;
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
