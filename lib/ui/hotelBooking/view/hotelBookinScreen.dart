import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/orderRepo/requestOrderRepo.dart';
import 'package:manafea/data/services/orderServices/requestOrderService.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/core/shared_widget/userBookingData.dart';
import 'package:manafea/ui/hotelBooking/connector/hotelConnector.dart';
import 'package:manafea/ui/hotelBooking/viewModel/hottelBookingViewModel.dart';
import 'package:manafea/ui/hotelBooking/widgets/stepOneWidget.dart';
import 'package:manafea/ui/hotelBooking/widgets/stepTwoWidget.dart';
import 'package:provider/provider.dart';

import '../../core/shared_widget/buildConfirmBookingInStepper.dart';
import '../../core/shared_widget/buildStepCounterInStepper.dart';
import '../../core/shared_widget/build_check_in_check_out_widget_in_stepper.dart';
import '../../core/shared_widget/succes_widget.dart';
import '../widgets/elevatedButtonStepper.dart';
import '../widgets/hotelScreenItem.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState
    extends BaseView<HotelBookingViewModel, HotelBookingScreen>
    implements HotelConnector {
  DateTime selectedDate = DateTime.now(); // تخزين التاريخ في المتغير

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HotelBookingViewModel>(
          builder: (context, viewModel, child) => SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey.shade100,
                // Light background for elegance

                body: viewModel.orderIsDone == false
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            const HotelScreenItem(),
                            SingleChildScrollView(
                              child: Material(
                                  // ✅ Wrap Stepper with Material
                                  child: Stepper(
                                key: ValueKey(viewModel.selectedRoomType),
                                controlsBuilder: (context, details) =>
                                    viewModel.index == 4 &&
                                            viewModel.selectedRoomType ==
                                                'Special'
                                        ? const SizedBox()
                                        : viewModel.index == 5 &&
                                                viewModel.selectedRoomType ==
                                                    'Common'
                                            ? SizedBox()
                                            : ElevatedButtonStepper(
                                                onStepCancel:
                                                    viewModel.onStepCancel,
                                                onStepContinue:
                                                    viewModel.onStepContinue,
                                              ),
                                margin: const EdgeInsets.all(0),
                                steps: viewModel.steps,
                                currentStep: viewModel.index,
                              )),
                            ),
                          ],
                        ),
                      )
                    : done_order_widget(context)),
          ),
        ));
  }

  @override
  stepOneContentInStepper() {
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) =>
            buildStepOneContentInStepper(
              onSelectRoom: viewModel.changeRoomSelected,
              selectedRoomType: viewModel.selectedRoomType,
            ));
  }

  @override
  HotelBookingViewModel init_my_view_model() {
    RequestOrderService requestOrderService = RequestOrderService();

    RequestOrderRepo requestOrderRepo = RequestOrderRepo(requestOrderService);
    // TODO: implement init_my_view_model
    return HotelBookingViewModel(requestOrderRepo);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }

  @override
  stepTwoContentInStepper() {
    // TODO: implement stepTwoContentInStepper
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) => buildStepCounterInStepper(
            title: viewModel.selectedRoomType == "Common"
                ? 'People Number'
                : "Room Count",
            increaseCount: viewModel.increaseRoomCount,
            minusCount: viewModel.minusRoomCount,
            count: viewModel.roomCount, totalPrice: viewModel.totalPrice ));
  }

  @override
  stepThreeContentInStepper() {
    return CheckInCheckOut(
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
    return UserBookingData();
  }

  @override
  stepFiveContentInStepperBookingButton() {
    // TODO: implement stepFiveContentInStepperBookingButton

    return ConfirmBookingInStepper(
        onStepContinue: viewModel.onStepContinue,
        onStepCancel: viewModel.onStepCancel);
  }

  @override
  stepTwoContentInStepperForCommonRoomType() {
    // TODO: implement stepTwoContentInStepperForCommonRoomType
    return Consumer<HotelBookingViewModel>(
        builder: (context, viewModel, child) =>
            buildStepTwoContentInStepperForCommonRoomJust(
                onSelectRoom: viewModel.changeCommonRoomTypeSelected,
                selectedCoomonRoomType: viewModel.selectedCommonRoomType));
  }
}
