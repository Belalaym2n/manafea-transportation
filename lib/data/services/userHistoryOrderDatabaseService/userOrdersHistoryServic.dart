import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

import '../../../domain/models/hotelModels/requestHotelBooking.dart';

class UserOrderHistoryFirebaseService {
  Future<List<BaseOrder>> getAllOrders() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userId", isEqualTo: "userID") // لاحقًا استبدلها بالـ user الحقيقي
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      final service = data["service"];

      switch (service) {
        case "Hotel Booking":
          return RequestHotelBooking.fromJson(data);
        case "Activity": 
          return RequestActivityOrderModel.fromJson(data);
        default:
          return BaseOrder.fromJson(data);
      }
    }).toList();
  }

  Future<void> deleteOrder(String id) {
    return FirebaseFirestore.instance.collection("Orders")
        .doc(id).delete();
  }
}
