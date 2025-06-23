import 'package:manafea/config/base_class.dart';

import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';

abstract class AdminOrderConnector extends BaseConnector {
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

  emptyOrders();

  showOrders(List<BaseOrder> order);

  onMessage(String message); // ✅ أضف دي
}
