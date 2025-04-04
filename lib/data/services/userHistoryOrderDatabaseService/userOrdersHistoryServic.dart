import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class UserOrderHistoryService {
  Future<List<BaseOrder>> getOrders() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Orders").
    where("userId", isEqualTo: "userID")
        .where("status", isEqualTo: "Pending")
        .withConverter<BaseOrder>(
      fromFirestore: (snapshot, _) => BaseOrder.fromJson(snapshot.data()!),
      toFirestore: (order, _) => order.toJson(),
    )
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
