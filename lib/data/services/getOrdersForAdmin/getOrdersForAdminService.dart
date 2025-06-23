import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

//16/06/2025
import '../../../config/error_handling/errorHandling.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../domain/models/baseOrderModel/orderFactoryForFromJson.dart';
import '../../../generated/locale_keys.g.dart';

class GetOrdersForAdminService {
  Stream<Result> getAllOrdersStream({required String date}) {
    return FirebaseFirestore.instance
        .collection("Orders")
        .where("orderDate", isEqualTo: date)
        .orderBy("orderDate", descending: true)

        .snapshots()
        .map((querySnapshot) {
      try {
        final orders = querySnapshot.docs.map((doc) {
          final data = doc.data();
          final service = data["service"];

          final factory = OrderFactoryRegistry.getFactory(service);
          return factory?.fromJson(data) ?? BaseOrder.fromJson(data);
        }).toList();

        return Result.success(orders);
      } catch (e) {
         return Result.failure(LocaleKeys.errors_error_message.tr());
      }
    }).handleError((error) {
      return Result.failure(error.toString());
    });
  }
  Future<Result> updateOrderStatus({
    required String id,
    required String status,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("Orders")
          .doc(id)
          .update({"status": status});
      return Result.success("Success");
    } catch (e) {
      return Result.failure("Something went wrong!");
    }
  }

}
