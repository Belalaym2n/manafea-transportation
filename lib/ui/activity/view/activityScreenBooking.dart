import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/orderRepo/requestOrderRepo.dart';
import 'package:manafea/data/services/orderServices/requestOrderService.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/activity/connector/activityConnector.dart';
import 'package:manafea/ui/activity/viewModel/activityBookingViewModel.dart';
import 'package:manafea/ui/activity/widget/bookingActivity/activityScreenBookingItem.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../config/appConstants.dart';
import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../core/shared_widget/buildConfirmBookingInStepper.dart';
import '../../core/shared_widget/buildStepCounterInStepper.dart';
import '../../core/shared_widget/succes_widget.dart';
import '../../core/shared_widget/userBookingData.dart';
import '../widget/bookingActivity/stepperButton.dart';
import '../widget/buildStepOneContentChooseBookingDay.dart';

class ActivityScreenBooking extends StatefulWidget {
  ActivityScreenBooking({super.key, required this.activityModel});

  ActivityModel activityModel;

  @override
  State<ActivityScreenBooking> createState() => _ActivityScreenBookingState();
}

class _ActivityScreenBookingState
    extends BaseView<ActivityBookingViewModel, ActivityScreenBooking>
    implements ActivityConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.loadUserDataForOrders(
        nameController: nameController,
        phoneController: phoneController);
    viewModel.connector = this;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<ActivityBookingViewModel>(
          builder: (context, viewModel, child) => SafeArea(
              child: AbsorbPointer(
            absorbing: viewModel.isLoading,
            child: Scaffold(
                body: viewModel.orderIsDone == false
                    ? Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                ActivityScreenBookingItem(
                                  activity: widget.activityModel,
                                ),
                                SizedBox(
                                    height: AppConstants.screenHeight / 1.6,
                                     child: Stepper(
                                      controlsBuilder: (context, details) =>
                                          viewModel.index != 3
                                              ? ElevatedButtonStepperBooking(
                                                  onStepCancel:
                                                      viewModel.onStepCancel,
                                                  onStepContinue: () =>
                                                      viewModel.onStepContinue(
                                                          name: nameController
                                                              .text,
                                                          phoneNumber:
                                                              phoneController
                                                                  .text))
                                              : SizedBox(),
                                      margin: const EdgeInsets.all(0),
                                      steps: viewModel.steps,
                                      currentStep: viewModel.index,
                                    ))
                              ],
                            ),
                          ),
                          if (viewModel.isLoading) showLoading()
                        ],
                      )
                    : SuccessOrder()),
          )),
        ));
  }

  @override
  buildStepTwoContentPeopleCount() {
    // TODO: implement buildStepOneContentPeopleCount
    return Consumer<ActivityBookingViewModel>(
        builder: (context, viewModel, child) => buildStepCounterInStepper(
            totalPrice:
                viewModel.totalPrice ?? viewModel.activityModel.itemPricing,
            title: LocaleKeys.orders_screen_people_count.tr(),
            increaseCount: viewModel.increasePeopleCount,
            minusCount: viewModel.minusPeopleCount,
            count: viewModel.peopleCount));
  }

  @override
  buildStepOneContentChooseDayBooking() {
    // TODO: implement buildStepThreeContentBooking
    return ChooseDayBooking(
      focusedDate: viewModel.focusedDateCheckOut,
      dateString: viewModel.dateString,
      onSelectDate: viewModel.changeSelectDate,
    );
  }

  @override
  buildStepThreeContentConfirmData() {
    // TODO: implement buildStepTwoContentConfirmData
    return UserBookingData(
      nameController: nameController,
      phoneController: phoneController,
    );
  }

  @override
  buildStepFourContentBooking() {
    // TODO: implement buildStepTwoContentConfirmData
    return ConfirmBookingInStepper(
        totalPrice: viewModel.totalPrice != null
            ? viewModel.totalPrice.toString()
            : widget.activityModel.itemPricing.toString(),
        onStepCancel: viewModel.onStepCancel,
        onStepContinue: viewModel.onStepContinue);
  }

  @override
  ActivityBookingViewModel init_my_view_model() {
    RequestOrderService requestOrderService = RequestOrderService();

    RequestOrderRepo requestOrderRepo = RequestOrderRepo(requestOrderService);
    // TODO: implement init_my_view_model
    return ActivityBookingViewModel(widget.activityModel, requestOrderRepo);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return const LoadingWidget();
  }
}
