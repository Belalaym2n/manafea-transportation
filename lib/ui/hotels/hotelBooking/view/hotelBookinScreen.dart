import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/orderRepo/requestOrderRepo.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/data/services/orderServices/requestOrderService.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/core/shared_widget/userBookingData.dart';

import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../core/shared_widget/buildConfirmBookingInStepper.dart';
import '../../../core/shared_widget/buildStepCounterInStepper.dart';
import '../../../core/shared_widget/build_check_in_check_out_widget_in_stepper.dart';
import '../../../core/shared_widget/succes_widget.dart';
import '../connector/hotelConnector.dart';
import '../viewModel/hottelBookingViewModel.dart';
import '../widgets/elevatedButtonStepper.dart';
import '../widgets/hotelScreenItem.dart';
import '../widgets/stepOneWidget.dart';
import '../widgets/stepTwoWidget.dart';

class HotelBookingScreen extends StatefulWidget {
  HotelBookingScreen({super.key, required this.hotelModel});

  AddHotelModel hotelModel;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState
    extends BaseView<HotelBookingViewModel, HotelBookingScreen>
    implements HotelConnector {
  DateTime selectedDate = DateTime.now(); // تخزين التاريخ في المتغير
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.loadUserDataForOrders(
        nameController: nameController, phoneController: phoneController);
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) => SafeArea(
          child: AbsorbPointer(
              absorbing: viewModel.isLoading,
              child: Scaffold(
                backgroundColor: Colors.grey.shade100,
                body: viewModel.orderIsDone == false
                    ? Stack(
                        children: [
                          SingleChildScrollView(
                            // لفّ الـ Column بالـ SingleChildScrollView
                            child: Column(
                              children: [
                                HotelScreenItem(
                                  hotelModel: widget.hotelModel,
                                ), // العنصر الثابت
                                // هنا قمنا بوضع الـ Stepper داخل SingleChildScrollView
                                Material(
                                  child: Stepper(
                                    key: ValueKey(viewModel.selectedRoomType),
                                    controlsBuilder: (context, details) =>
                                        viewModel.index == 4 &&
                                                viewModel.selectedRoomType ==
                                                    'Special'
                                            ? const SizedBox()
                                            : viewModel.index == 5 &&
                                                    viewModel
                                                            .selectedRoomType ==
                                                        'Common'
                                                ? SizedBox()
                                                : ElevatedButtonStepper(
                                                    onStepCancel:
                                                        viewModel.onStepCancel,
                                                    onStepContinue: (phone,
                                                            name) =>
                                                        viewModel.selectedRoomType ==
                                                                    '' ||
                                                                viewModel
                                                                        .selectedRoomType ==
                                                                    'Special'
                                                            ? viewModel
                                                                .onStepContinue(
                                                                phoneNumber:
                                                                    phoneController
                                                                        .text,
                                                                name:
                                                                    nameController
                                                                        .text,
                                                              )
                                                            : viewModel
                                                                .onStepContinueForCommonRoom(
                                                                phoneNumber:
                                                                    phoneController
                                                                        .text,
                                                                name:
                                                                    nameController
                                                                        .text,
                                                              ),
                                                  ),
                                    margin: const EdgeInsets.all(0),
                                    steps: viewModel.steps,
                                    currentStep: viewModel.index,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (viewModel.isLoading) // عرض الـ loading indicator
                            showLoading(),
                        ],
                      )
                    : const SuccessOrder(),
              )),
        ),
      ),
    );
  }

  @override
  HotelBookingViewModel init_my_view_model() {
    RequestOrderService requestOrderService = RequestOrderService();

    RequestOrderRepo requestOrderRepo = RequestOrderRepo(requestOrderService);
    // TODO: implement init_my_view_model
    return HotelBookingViewModel(requestOrderRepo, widget.hotelModel);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return LoadingWidget();
  }

  @override
  stepOneContentInStepper() {
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) =>
            buildStepOneContentInStepperChooseRoomType(
              onSelectRoom: viewModel.changeRoomSelected,
              selectedRoomType: viewModel.selectedRoomType,
            ));
  }

  @override
  stepTwoContentInStepper() {
    // TODO: implement stepTwoContentInStepper
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) => buildStepCounterInStepper(
            title: viewModel.selectedRoomType == "Common"
                ? LocaleKeys.hotelsScreen_people_number.tr()
                : LocaleKeys.hotelsScreen_room_count.tr(),
            increaseCount: viewModel.increaseRoomCount,
            minusCount: viewModel.minusRoomCount,
            count: viewModel.roomCount,
            totalPrice: viewModel.selectedRoomType == "Common"
                ? viewModel.hotel.commonRoomPricing.toInt()
                : viewModel.hotel.specialRoomPricing.toInt()));
  }

  @override
  stepThreeContentInStepper() {
    return CheckInCheckOut(
      calculatePrice: viewModel.calculateAllPrice,
      headlineTwo: LocaleKeys.orders_screen_check_in.tr(),
      headlineOne: LocaleKeys.orders_screen_check_out.tr(),
      onSelectCheckInDate: viewModel.changeSelectCheckInDate,
      onSelectCheckOutDate: viewModel.changeSelectCheckOutDate,
      focusedDateCheckInDate: viewModel.focusedDateCheckIn,
      focusedDateCheckOutDate: viewModel.focusedDateCheckOut,
      checkInDateString: viewModel.checkInDateString,
      checkOutDateString: viewModel.checkOutDateString,
    );
  }

  @override
  stepFourContentInStepperUserBookingInfo() {
    // TODO: implement stepFourContentInStepperUserBookingInfo
    return UserBookingData(
      phoneController: phoneController,
      nameController: nameController,
    );
  }

  @override
  stepFiveContentInStepperBookingButton() {
    // TODO: implement stepFiveContentInStepperBookingButton

    return ConfirmBookingInStepper(
        totalPrice: viewModel.totalPrice.toString(),
        onStepContinue: viewModel.selectedRoomType == 'Special'
            ? viewModel.onStepContinue
            : viewModel.onStepContinueForCommonRoom,
        onStepCancel: viewModel.onStepCancel);
  }

  @override
  stepTwoContentInStepperForCommonRoomType() {
    // TODO: implement stepTwoContentInStepperForCommonRoomType
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) =>
            buildStepTwoContentInStepperForCommonRoomChooseManOrWoman(
                chooseType: viewModel.chooseCommonRoomType,
                selectedCommonRoomType: viewModel.selectedCommonRoomType));
  }
}
