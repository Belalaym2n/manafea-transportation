import 'package:manafea/data/services/orderServices/requestOrderService.dart';
import 'package:manafea/domain/models/requestOrderModel.dart';

class RequestOrderRepo {
  RequestOrderService requestOrderService;

  RequestOrderRepo(this.requestOrderService);

  requestOrder({required RequestOrderModel requestOrder}) {
    return requestOrderService.requestOrder(requestOrderModel: requestOrder);
  }
}
