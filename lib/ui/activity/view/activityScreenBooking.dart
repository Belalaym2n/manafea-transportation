import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/activity/connector/activityConnector.dart';
import 'package:manafea/ui/activity/viewModel/activityBookingViewModel.dart';
import 'package:manafea/ui/activity/widget/activityScreenBookingItem.dart';
import 'package:manafea/ui/core/shared_widget/buildConfirmBookingInStepper.dart';
import 'package:provider/provider.dart';

import '../../../config/appConstants.dart';
import '../../core/shared_widget/buildStepCounterInStepper.dart';
import '../../core/shared_widget/build_check_in_check_out_widget_in_stepper.dart';
import '../../core/shared_widget/succes_widget.dart';
import '../../core/shared_widget/userBookingData.dart';
import '../../hotelBooking/widgets/elevatedButtonStepper.dart';
import '../widget/buildStepOneContentChooseBookingDay.dart';

class ActivityScreenBooking extends StatefulWidget {
  const ActivityScreenBooking({super.key});

  @override
  State<ActivityScreenBooking> createState() => _ActivityScreenBookingState();
}

class _ActivityScreenBookingState extends BaseView
<ActivityBookingViewModel,ActivityScreenBooking> implements ActivityConnector
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ActivityBookingViewModel>(
          builder: (context, viewModel, child) => SafeArea(
            child: Scaffold(
                body:  viewModel.orderIsDone==false?
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ActivityScreenBookingItem(),
                      // SizedBox(
                      //     height: AppConstants.screenHeight / 1.6,
                      //     // ✅ Wrap Stepper with Material
                      //     child: Stepper(
                      //       controlsBuilder: (context, details) =>
                      //       viewModel.index != 3
                      //           ? ElevatedButtonStepper(
                      //         onStepCancel: viewModel.onStepCancel,
                      //         onStepContinue:
                      //         viewModel.onStepContinue(
                      //
                      //         ),
                      //       )
                      //           : SizedBox(),
                      //       margin: const EdgeInsets.all(0),
                      //       steps: viewModel.steps,
                      //       currentStep: viewModel.index,
                      //     ))
                    ],
                  ),
                ):done_order_widget(
                    context
                )), 
          )),
    );
  }

  @override
  buildStepTwoContentPeopleCount() {
    // TODO: implement buildStepOneContentPeopleCount
    return UserBookingData();
  }

  @override
  buildStepOneContentChooseDayBooking() {
    // TODO: implement buildStepThreeContentBooking
    return ChooseDayBooking();
  }

  @override
  buildStepThreeContentConfirmData() {
    // TODO: implement buildStepTwoContentConfirmData
    return
      Consumer<ActivityBookingViewModel>(
          builder: (context, viewModel, child) =>
              buildStepCounterInStepper(
                  totalPrice: 22,
                  title: "People Count",
                  increaseCount:
                  viewModel.increaseRoomCount, minusCount: viewModel.minusRoomCount
                  , count: viewModel.peopleCount));
  }


  @override
  buildStepFourContentBooking() {
    // TODO: implement buildStepTwoContentConfirmData
    // return ConfirmBookingInStepper(onStepCancel: viewModel.onStepCancel,
    //     onStepContinue: viewModel.onStepContinue);
  }
  @override
  ActivityBookingViewModel init_my_view_model() {
    // TODO: implement init_my_view_model
    return ActivityBookingViewModel();
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
}
