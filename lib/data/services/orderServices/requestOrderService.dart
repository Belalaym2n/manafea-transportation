import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manafea/domain/models/requestOrderModel.dart';

class RequestOrderService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  requestOrder({required RequestOrderModel requestOrderModel}) {
    return _firestore.collection("Orders").add(requestOrderModel.toJson());
  }
}
