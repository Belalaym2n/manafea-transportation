import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
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

class _CarBookingScreenState extends BaseView<GetAllCarsViewModel, CarsScreen>
    implements GetCarsConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(AppConstants.screenHeight);
    print(AppConstants.screenWidth);
    viewModel.getData();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<GetAllCarsViewModel>(
            builder: (context, value, child) => AbsorbPointer(
                  absorbing: value.isLoading,
                  child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        scrolledUnderElevation: 0,
                        title: Text(LocaleKeys.car_screen_available_cars.tr(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
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
                      )),
                )));
  }

  @override
  GetAllCarsViewModel init_my_view_model() {
    GetServiceDataSupabaseService getServiceDataSupabaseService =
        GetServiceDataSupabaseService();
    GetServiceDataSupabaseRepo getCars =
        GetServiceDataSupabaseRepo(getServiceDataSupabaseService);
    // TODO: implement init_my_view_model
    return GetAllCarsViewModel.getInstance(getCars);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    double spetRatio =
        (AppConstants.screenWidth * 0.86)
            / (AppConstants.screenHeight * 0.5);
    // TODO: implement showLoading
    return Skeletonizer(
        child: Padding(
            padding: EdgeInsets.all(AppConstants.screenWidth * 0.036),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.screenWidth * 0.03,
                  mainAxisSpacing: AppConstants.screenHeight * 0.017,
                  childAspectRatio:  spetRatio ,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final car = CarBuilder()
                      .setItemName("name")
                      .setItemDescription("description")
                      .setItemImageUrl(
                          "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a") // ✅ بعد رفع الصورة
                      .setItemPricing(
                          12) // pricing تصحيح هنا برضو
                      .build();
                  return SingleChildScrollView(
                    child: CarScreenItem(
                      carModel: car,
                    ),
                  );
                })));
  }

  @override
  emptyData() {
    // TODO: implement emptyData

    return Text(
      LocaleKeys.car_screen_no_cars_available.tr(),
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  gridViewData(List<CarModel> cars) {
    double spetRatio =
        (AppConstants.screenWidth * 0.86)
            / (AppConstants.screenHeight * 0.5);
    print("ratio $spetRatio");

    // TODO: implement gridViewData
    return Padding(
        padding: EdgeInsets.all(AppConstants.screenWidth * 0.036),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.screenWidth * 0.03,
              mainAxisSpacing: AppConstants.screenHeight * 0.017,
              childAspectRatio: spetRatio    ,
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              var carModel = cars[index];
              return SingleChildScrollView(
                  child:CarScreenItem(carModel: carModel))     ;
            }));
    ;
  }
}
