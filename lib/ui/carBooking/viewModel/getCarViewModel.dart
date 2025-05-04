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

  Future<void> getData() async {
    setLoading(true);
    try {
      final result = await getCars.getSpecificService(
        service: "Cars",
        fromJson: AddCarModel.fromJson,
      );
      if (result.isSuccess) {
        cars = result.data!;  // إذا كانت النتيجة ناجحة، نحدث قائمة السيارات
      } else {
        connector!.onError(result.error!);  // إذا كانت النتيجة فاشلة، نعرض الخطأ
      }
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

    return connector!.gridViewData(cars);

  }
  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
