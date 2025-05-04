import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../domain/models/baseOrderModel/orderFactoryForFromJson.dart';
import '../../../domain/models/hotelModels/requestHotelBooking.dart';

class UserOrderHistoryFirebaseService {
  Future<Result<List<BaseOrder>>> getAllOrders( ) async {
    try{
    String userId=await
    SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.userId);
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userId", isEqualTo: userId)
         .get();

    final orders=   querySnapshot.docs.map((doc) {

      final data = doc.data();
      final service = data["service"];

      final factory = OrderFactoryRegistry.getFactory(service);
      return factory?.fromJson(data) ?? BaseOrder.fromJson(data);

    }).toList();
    return Result.success(orders);
  }catch(e){
      return Result.failure(LocaleKeys.errors_error_message.tr());
    }
    }

  Future<void> deleteOrder(String id) {
    return FirebaseFirestore.instance.collection("Orders")
        .doc(id).delete();
  }
}
