import 'package:manafea/config/base_class.dart';

import '../../../../domain/models/hotelModels/addHotel.dart';

abstract class GetHotelsConnector extends BaseConnector{
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


  emptyDataWidget();
  showDataWidget(List<AddHotelModel> hotels);


}