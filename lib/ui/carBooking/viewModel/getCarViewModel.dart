import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/ui/carBooking/connector/getCarsConnector.dart';
import 'package:manafea/ui/carBooking/widgets/cars_screen_item.dart';

import '../../../config/appConstants.dart';
import '../../../data/repositories/GetServiceDataSupabaseRepo/GetServiceDataSupabaseRepo.dart';

class GetAllCarsViewModel extends BaseViewModel<GetCarsConnector> {
  GetServiceDataSupabaseRepo getCars;
  List<AddCarModel> cars = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  GetAllCarsViewModel(this.getCars);

  getData() async {
    setLoading(true);
    try {
      cars = await getCars.getSpecificService(
          service: "Cars", fromJson: AddCarModel.fromJson);
      notifyListeners();
      setLoading(false);

    } catch (E) {
      setLoading(false);

      connector!.onError(E.toString());
    }
  }

  Widget showCars() {
    if (cars.isEmpty&&isLoading==false) {
      return connector!.emptyData();
    }

    return Padding(
        padding: EdgeInsets.all(AppConstants.screenWidth * 0.036),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.screenWidth * 0.03,
              mainAxisSpacing: AppConstants.screenHeight * 0.017,
              childAspectRatio: 0.8,
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              var carModel = cars[index];

              return CarScreenItem(carModel: carModel);
            }));
  }
  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
