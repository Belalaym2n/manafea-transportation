import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

abstract class GetUserOrderConnector extends BaseConnector{
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

  deleteOrderLoading();
  emptyOrders();
  showOrders(List<BaseOrder>order);


}