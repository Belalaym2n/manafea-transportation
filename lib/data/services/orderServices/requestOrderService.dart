import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';


class RequestOrderService {
  final ordersCollection = FirebaseFirestore.instance
      .collection('Orders')
      .withConverter<BaseOrder>(
        fromFirestore: (snapshot, _) {
          final data = snapshot.data()!;
          return BaseOrder.fromJson(data);
        },
        toFirestore: (order, _) => order.toJson(),
      );

  Future<void> uploadOrder({required BaseOrder model}) async {
    try {
      var docRef = ordersCollection.doc();
      model.id=docRef.id;

      await docRef.set(model);
      print('Order uploaded successfully!');
    } catch (e) {
      print('Error uploading order: $e');
      rethrow; // Rethrow the error to be handled by the calling function if necessary
    }
  }
}
