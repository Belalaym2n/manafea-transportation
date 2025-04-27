import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/ui/activity/connector/getActivitesConnector.dart';
import 'package:manafea/ui/carBooking/connector/getCarsConnector.dart';
import 'package:manafea/ui/carBooking/viewModel/getCarViewModel.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/appConstants.dart';
import '../../../data/repositories/GetServiceDataSupabaseRepo/GetServiceDataSupabaseRepo.dart';
import '../../../data/services/getServiecesDataFromSupabase/getServicesDataFromSupabaseService.dart';
import '../widgets/cars_screen_item.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends BaseView<GetAllCarsViewModel
,CarsScreen> implements GetCarsConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getData();
    viewModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider.value(
      value: viewModel,

      child:Consumer<GetAllCarsViewModel>(
        builder: (context, value, child) =>

        AbsorbPointer(
          absorbing: value.isLoading,
          child: Scaffold(
          appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,

          title: const Text(" Available Cars",
          style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      ),
      body: Stack(
        children: [
          value.showCars(),

              if (value.isLoading == true)
          Center(
            child: showLoading(), // يظهر الـ loading هنا
          ),
        ],
      ) ),
    )));
  }

  @override
  GetAllCarsViewModel init_my_view_model() {
    GetServiceDataSupabaseService getServiceDataSupabaseService=
        GetServiceDataSupabaseService();
    GetServiceDataSupabaseRepo getCars=
        GetServiceDataSupabaseRepo(getServiceDataSupabaseService);
    // TODO: implement init_my_view_model
    return GetAllCarsViewModel(getCars);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return  Skeletonizer(child:
    Padding(
        padding: EdgeInsets.all(AppConstants.screenWidth * 0.036),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.screenWidth * 0.03,
              mainAxisSpacing: AppConstants.screenHeight * 0.017,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {

              return CarScreenItem
                ();
            })));

  }

  @override
  emptyData() {
    // TODO: implement emptyData
    
    return Text("NO Data");
  }
}
