import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manafea/data/repositories/orderRepo/requestOrderRepo.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';

import '../../../../config/base_class.dart';
import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../../domain/models/hotelModels/requestHotelBooking.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../core/shared_widget/stepper_widget.dart';
import '../connector/hotelConnector.dart';

class HotelBookingViewModel extends BaseViewModel<HotelConnector> {
  int index = 0;
  int _roomCount = 1;
  int _totalPrice = 0;

  String _selectedRoomType = "";
  String _selectedCommonRoomType = "";

  // for data booking
  String _phoneNumber = '';
  String _name = '';

  String _selectedType = "";
  bool _orderIsDone = false;
   bool _isLoading = false;
  String checkInDateString =
  LocaleKeys.hotelsScreen_select_Date.tr();
  String checkOutDateString =
  LocaleKeys.hotelsScreen_select_Date.tr();


  DateTime focusedDateCheckOut =
  DateTime.now().subtract(const Duration(days: 2));

  DateTime focusedDateCheckIn =
  DateTime.now().subtract(Duration(days: 2));

  bool get orderIsDone => _orderIsDone;

  bool get isLoading => _isLoading;

  String get selectedRoomType => _selectedRoomType;

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  String get selectedCommonRoomType => _selectedCommonRoomType;

  String get selectedType => _selectedType;

  int get totalSteps => selectedRoomType == "Common" ? 6 : 5;

  int get roomCount => _roomCount;

  int get totalPrice => _totalPrice;

  RequestOrderRepo requestOrderRepo;
  AddHotelModel hotel;

  HotelBookingViewModel(this.requestOrderRepo, this.hotel);

// stepper buttons
  onStepContinue({
    String? phoneNumber,
    String? name,
  }) async {
    bool isRoomTypeNullable = roomTypeNullable();
    bool isDatsValid = validDatesSelected(1);
    bool isValidDataBooking = await validBookingData(
        name: name, phoneNumber: phoneNumber, stepIndex: 3);
    if (isRoomTypeNullable == true) {
      return connector!
    .onError(LocaleKeys.hotelsScreen_please_choose_your_room_type.tr());
    }

    if (isDatsValid == false) {
      return connector!.onError(LocaleKeys.errors_booking_at_least_one_day.tr());
    }

    if (isValidDataBooking == false) {
      return connector?.onError(LocaleKeys.errors_name_and_number_must_not_be_empty.tr());
    }


    if (index == 4) {
      print("Sending request...");
      await requestOrder();
    }
    _moveToNextStep(4);
    print("index $index");
  }

  bool roomTypeNullable() {
    if (index == 0 && selectedRoomType.trim().isEmpty) {
      return true;
    }
    return false;
  }

  bool validDatesSelected(int stepIndex) {
    if (index == stepIndex && checkOutDateString
        ==  LocaleKeys.hotelsScreen_select_Date.tr()
    ||
    index==stepIndex&&checkInDateString ==   LocaleKeys.hotelsScreen_select_Date.tr()

    ) {
      return false;
    }
    if (index == stepIndex && checkInDateString == checkOutDateString) {
      return false;
    }
    return true;
  }

  onStepContinueForCommonRoom({
    String? phoneNumber,
    String? name,
  }) async {

    if (index == 1 && _selectedCommonRoomType == '') {
      return connector!.onError(LocaleKeys.errors_please_choose_common_room_type.tr());
    }

    bool isDatsValid = validDatesSelected(2);
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
    checkOutDateString=LocaleKeys.hotelsScreen_select_Date.tr();
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
      calculateAllPrice();
     notifyListeners();
  }

  int calculateStayDuration() {
    final normalizedCheckIn = DateTime(focusedDateCheckIn.year,
        focusedDateCheckIn.month, focusedDateCheckIn.day);
    final normalizedCheckOut = DateTime(focusedDateCheckOut.year,
        focusedDateCheckOut.month, focusedDateCheckOut.day);
    final duration = normalizedCheckOut.difference(normalizedCheckIn);
    int days = duration.inDays;

    print(duration);
    print(days);

    if (checkOutDateString ==   LocaleKeys.hotelsScreen_select_Date.tr()) {
      days = 0;
      notifyListeners();
    }

    return days;
  }

  int calculateAllPrice() {
    int allDays = calculateStayDuration();
    if (selectedRoomType == "Common")
      _totalPrice = ((hotel.commonRoomPricing) * allDays) * _roomCount;
    else {
      _totalPrice = ((hotel.specialRoomPricing) * allDays) * _roomCount;
    }
    return _totalPrice;
  }

  void minusRoomCount() {
    if (_roomCount > 1)
      _roomCount--;
    calculateAllPrice();

    print("totoal price $totalPrice");
    notifyListeners();
  }

  // step three select day booking in stepper

  changeSelectCheckInDate(DateTime dateTime) {
    focusedDateCheckIn = dateTime;
    checkInDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    checkOutDateString =  LocaleKeys.hotelsScreen_select_Date.tr();

    notifyListeners();
  }

  changeSelectCheckOutDate(DateTime dateTime) {
    focusedDateCheckOut = dateTime;
    checkOutDateString = DateFormat('dd/MM/yyyy').format(dateTime);
    notifyListeners();
  }

  // step five user booking data

  // check validate booking data
  Future<bool> validBookingData(
      {String? phoneNumber, String? name, int? stepIndex}) async {
    if (index == stepIndex) {

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

  requestOrder() async {
    try {
      final DateFormat formatter = DateFormat('h:mm a');
      String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

      setLoading(true);
      String id =await SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.userId);

      print("name $name");
      final orderBuilder = RequestHotelBookingBuilder()
          .setName(name)
          .setPhoneNumber(phoneNumber)
          .setOrderDate(formattedDate)
          .setPrice(_totalPrice.toDouble())
          .setUserId(id)
          .setStatus("Pending")
          .setTime(formatter.format(DateTime.now()))
          .setCheckIn(checkInDateString)
          .setCheckOut(checkOutDateString)
          .setRoomType(_selectedRoomType)
          .setRoomCount(_roomCount)
          .setService("Hotel Booking");

      print("name $name");
      print(orderBuilder.name);
      if (_selectedCommonRoomType != '') {
        print("belal]");
        orderBuilder.setCommonRoomTyp(_selectedCommonRoomType);
      }

      final order = orderBuilder.build();

      await requestOrderRepo.requestOrder(requestOrder: order);

      SharedPreferencesHelper.saveData(key: SharedSharedPreferencesKeys.
      nameOrder, value: name);
      SharedPreferencesHelper.saveData(key: SharedSharedPreferencesKeys.
      phoneOrder, value: phoneNumber
      );
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
        tittle:  LocaleKeys.hotelsScreen_please_choose_your_room_type.tr(
        ),
      ),
      if (selectedRoomType == "Common")
        buildStep(
          colorIndex: index > 1,
          isActive: index > 1,
          content: connector!.stepTwoContentInStepperForCommonRoomType(),
          isCurrentStep: index == 1,
          // ✅ ضبط الفهرس ليكون 1 بدلاً من 2
          tittle: LocaleKeys.hotelsScreen_choose_common_room_type.tr(),
        ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 2 : index > 1,
        isActive: index > 3,
        content: connector!.stepThreeContentInStepper(),
        isCurrentStep: index == 3,
        tittle: LocaleKeys.hotelsScreen_check_in_out.tr(),
      ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 3: index > 2,
        isActive: index > 2,
        content: connector!.stepTwoContentInStepper(),
        isCurrentStep: index == 2,
        tittle: LocaleKeys.hotelsScreen_room_count.tr(),
      ),

      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 4 : index > 3,
        isActive: index > 4,
        content: connector!.stepFourContentInStepperUserBookingInfo(),
        isCurrentStep: index == 4,
        tittle:LocaleKeys.hotelsScreen_confirm_details.tr(),
      ),
      buildStep(
        colorIndex: selectedRoomType == "Common" ? index > 5 : index > 4,
        isActive: index > 5,
        content: connector!.stepFiveContentInStepperBookingButton(),
        isCurrentStep: index == 5,
        tittle:LocaleKeys.hotelsScreen_confirm_booking.tr(),
      ),
    ];
  }
}
