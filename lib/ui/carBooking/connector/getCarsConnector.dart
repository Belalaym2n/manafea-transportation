import 'package:manafea/config/base_class.dart';

import '../../../domain/models/carModels/addCarModel.dart';

abstract class GetCarsConnector extends BaseConnector{
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


  gridViewData(List<AddCarModel> cars);
  emptyData();


}