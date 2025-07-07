import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/carBooking/connector/carBookingConnector.dart';
import 'package:manafea/ui/carBooking/viewModel/CarBookingViewModel.dart';
import 'package:manafea/ui/carBooking/widgets/car_booking_screen_item.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/core/shared_widget/succes_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/orderRepo/requestOrderRepo.dart';
import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../data/services/orderServices/requestOrderService.dart';
import '../../activity/widget/bookingActivity/stepperButton.dart';
import '../../auth/widgets/loadingWidget.dart';
import '../../core/shared_widget/buildConfirmBookingInStepper.dart';
import '../../core/shared_widget/build_check_in_check_out_widget_in_stepper.dart';
import '../../core/shared_widget/userBookingData.dart';
import '../widgets/stepper_widgets/stepOneContentInStepperChooseLocation.dart';

class CarBookingScreen extends StatefulWidget {
  CarBookingScreen({super.key, required this.carModel});

  CarModel carModel;

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
    SharedPreferencesHelper.loadUserDataForOrders(
        nameController: nameController, phoneController: phoneController);
    viewModel.connector = this;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CarBookingViewModel>(
          builder: (context, viewModel, child) => SafeArea(
                child: Scaffold(
                    body: viewModel.orderIsDone == false
                        ? SingleChildScrollView(
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    CarBookingScreenItem(
                                      carModel: widget.carModel,
                                    ),
                                    SizedBox(
                                        height: AppConstants.screenHeight / 1.6,
                                        child: Stepper(
                                          controlsBuilder: (context, details) =>
                                              viewModel.index != 3
                                                  ? ElevatedButtonStepperBooking(
                                                      onStepCancel: viewModel
                                                          .onStepCancel,
                                                      onStepContinue: () =>
                                                          viewModel.onStepContinue(
                                                            address: addressController.text,
                                                              name:
                                                                  nameController
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
                                if (viewModel.isLoading)
                                  Center(child: showLoading())
                              ],
                            ),
                          )
                        : SuccessOrder()),
              )),
    );
  }

  @override
  CarBookingViewModel init_my_view_model() {
    RequestOrderService requestOrderService = RequestOrderService();
    RequestOrderRepo requestOrderRepo = RequestOrderRepo(requestOrderService);
    return CarBookingViewModel(widget.carModel, requestOrderRepo);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return Column(
      children: [
        SizedBox(
          height: AppConstants.screenHeight * 0.4,
        ),
        LoadingWidget(),
      ],
    );
  }

  @override
  stepFourContentInStepperBookingButton() {
    return ConfirmBookingInStepper(
        totalPrice: viewModel.allPrice.toString(),
        onStepCancel: viewModel.onStepCancel,
        onStepContinue: viewModel.onStepContinue);
  }

  @override
  stepOneContentInStepperChooseLocation() {
    // TODO: implement stepOneContentInStepperChooseLocation
    return BuildStepOneContentInStepperChooseLocation(
      changeLocation: viewModel.changeSelectedLocation,
      selectedLocation: viewModel.selectedLocation,
    );
  }

  @override
  stepThreeContentInStepperConfirmUserData() {
    // TODO: implement stepThreeContentInStepperConfirmUserData
    return Column(
      children: [
        UserBookingData(
          phoneController: phoneController,
          nameController: nameController,
        ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.055, vertical: AppConstants.screenHeight * 0.012),
    child:  customTextFormField(
          controller: addressController  ,
          textInputType: TextInputType.text,
          hintText: LocaleKeys.form_add_specific_address.tr(),
          icon: Icons.person,
           validator: (value) {

            return null;
          },
        ),)
      ],
    );
  }

  @override
  stepTwoContentInStepperChooseCheckInAndCheckOut() {
    // TODO: implement stepTwoContentInStepperChooseCheckInAndCheckOut
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "${LocaleKeys.car_screen_all_price.tr()} ${viewModel.allPrice}",
            style: TextStyle(
                fontSize: AppConstants.screenWidth * 0.044,
                fontWeight: FontWeight.bold),
          ),
        ),

    //  headlineOne: LocaleKeys.orders_screen_check_out.tr(),
    // onSelectCheckInDate: viewModel.changeSelectCheckInDate,
    // onSelectCheckOutDate: viewModel.changeSelectCheckOutDate,
    // focusedDateCheckInDate: viewModel.focusedDateCheckIn,
    // focusedDateCheckOutDate: viewModel.focusedDateCheckOut,
    // checkInDateString: viewModel.checkInDateString,
    // checkOutDateString: viewModel.checkOutDateString,
    // );
    // }
        CheckInCheckOut(
          calculatePrice: viewModel.calculateAllPrice,
          headlineOne: LocaleKeys.car_screen_dispatch.tr(),
          headlineTwo: LocaleKeys.car_screen_delivery.tr(),
          onSelectCheckInDate: viewModel.changeSelectCheckInDate,
          onSelectCheckOutDate: viewModel.changeSelectCheckOutDate,
          focusedDateCheckInDate: viewModel.focusedDateDelivery,
          focusedDateCheckOutDate: viewModel.focusedDateReceipt,
          checkInDateString: viewModel.deliveryDateString,
          checkOutDateString: viewModel.receiptDateString,
        ),
      ],
    );
  }
}
