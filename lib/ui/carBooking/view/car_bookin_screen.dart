import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/ui/carBooking/connector/carBookingConnector.dart';
import 'package:manafea/ui/carBooking/viewModel/CarBookingViewModel.dart';
import 'package:manafea/ui/carBooking/widgets/car_booking_screen_item.dart';
import 'package:manafea/ui/core/shared_widget/succes_widget.dart';
import 'package:provider/provider.dart';

import '../../core/shared_widget/buildConfirmBookingInStepper.dart';
import '../../core/shared_widget/build_check_in_check_out_widget_in_stepper.dart';
import '../../core/shared_widget/userBookingData.dart';
import '../../hotelBooking/widgets/elevatedButtonStepper.dart';
import '../widgets/stepper_widgets/stepOneContentInStepperChooseLocation.dart';

class CarBookingScreen extends StatefulWidget {
    CarBookingScreen({super.key,required this.carModel});

    AddCarModel carModel;

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState
    extends BaseView<CarBookingViewModel, CarBookingScreen>
    implements CarBookingConnector {
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
      child: Consumer<CarBookingViewModel>(
          builder: (context, viewModel, child) => SafeArea(
                child: Scaffold(

                    body: viewModel.orderIsDone
                        ==false?SingleChildScrollView(
                  child: Column(
                    children: [
                        CarBookingScreenItem(
                          carModel: widget.carModel,
                        ),
                      SizedBox(
                          height: AppConstants.screenHeight / 1.6,
                          // ✅ Wrap Stepper with Material
                          // child:
                          // Stepper(
                          //   controlsBuilder: (context, details) =>
                          //       viewModel.index != 3
                          //           ? ElevatedButtonStepper(
                          //               onStepCancel: viewModel.onStepCancel,
                          //               onStepContinue:
                          //                   viewModel.onStepContinue,
                          //             )
                          //           : SizedBox(),
                          //   margin: const EdgeInsets.all(0),
                          //   steps: viewModel.steps,
                          //   currentStep: viewModel.index,
                          // )
                      //)
                      )
                    ],
                  ),
                ):SuccessOrder( )),
              )),
    );
  }

  @override
  CarBookingViewModel init_my_view_model() {
    // TODO: implement init_my_view_model
    return CarBookingViewModel();
  }

  @override
  onError(String message) {
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }

  @override
  stepFourContentInStepperBookingButton() {
    // TODO: implement stepFiveContentInStepperBookingButton
    // return ConfirmBookingInStepper(
    //   onStepCancel: viewModel.onStepCancel,
    //   onStepContinue: viewModel.onStepContinue,
    // );
  }

  @override
  stepOneContentInStepperChooseLocation() {
    // TODO: implement stepOneContentInStepperChooseLocation
    return BuildStepOneContentInStepperChooseLocation();
  }

  @override
  stepThreeContentInStepperConfirmUserData() {
    // TODO: implement stepThreeContentInStepperConfirmUserData
    return UserBookingData();
  }

  @override
  stepTwoContentInStepperChooseCheckInAndCheckOut() {
    // TODO: implement stepTwoContentInStepperChooseCheckInAndCheckOut
    return Container();
  }
}
