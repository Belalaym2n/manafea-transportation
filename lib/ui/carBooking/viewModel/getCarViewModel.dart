import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/ui/carBooking/connector/getCarsConnector.dart';
import 'package:manafea/ui/carBooking/widgets/cars_screen_item.dart';

import '../../../config/appConstants.dart';
import '../../../data/repositories/GetServiceDataSupabaseRepo/GetServiceDataSupabaseRepo.dart';

class GetAllCarsViewModel extends BaseViewModel<GetCarsConnector> {
  static GetAllCarsViewModel? _instance;
  GetServiceDataSupabaseRepo getCars;
  List<CarModel> cars = [];
  bool _isLoading = false;
  bool _isDataLoadedFirst = false;
  bool get isLoading => _isLoading;
  bool get isDataLoadedFirst => _isDataLoadedFirst;
  GetAllCarsViewModel._internal(this.getCars);

  static GetAllCarsViewModel getInstance(GetServiceDataSupabaseRepo getCar) {
    _instance ??= GetAllCarsViewModel._internal(getCar)
    ;
    return _instance!;
  }

  Future<void> getData() async {
    if(isDataLoadedFirst){
      return;
    }
    setLoading(true);

    try {
      final result = await getCars.getSpecificService(
        service: "Cars",
        fromJson: CarModel.fromJson,
      );
      _isDataLoadedFirst=true;
      notifyListeners();
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
