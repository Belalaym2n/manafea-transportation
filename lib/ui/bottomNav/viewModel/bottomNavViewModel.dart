import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/userModel/userModel.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
import 'package:manafea/ui/home/view/homeScreenItem.dart';
import 'package:manafea/ui/notification/view/notifcationScreen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../domain/models/baseOrderModel/orderFactoryForFromJson.dart';
import '../../activity/view/activityScreen.dart';
import '../../addCar/view/addCarScreen.dart';
import '../../addHotel/view/addHotel.dart';
import '../../getOrders/getOrderForAdmin/view/getOrderScreen.dart';
import '../../getOrders/getOrderForAdmin/widgets/widgetsChangedAdminOrders/buildActivityWidgetForAdmin.dart';
import '../../getOrders/getOrderForAdmin/widgets/widgetsChangedAdminOrders/buildCarWidget.dart';
import '../../getOrders/getOrderForAdmin/widgets/widgetsChangedAdminOrders/buildHotelBookingOrderDetailec.dart';
import '../../getOrders/getOrdersForUser/view/userOrders.dart';
import '../../getOrders/getOrdersForUser/widgets/widgetsChangedInOrderItem/buildActivityWidget.dart';
import '../../getOrders/getOrdersForUser/widgets/widgetsChangedInOrderItem/buildCarWidget.dart';
import '../../getOrders/getOrdersForUser/widgets/widgetsChangedInOrderItem/buildHotelBookingOrderDetailec.dart';

class BottomNavViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  String? _name;

  String? get name => _name;
  String? _phone;

  String? get phone => _phone;

  int get selectedIndex => _selectedIndex;

  Future<void> requestNotificationPermission() async {
    await OneSignal.Notifications.requestPermission(
        true); // تفعيل فتح الإعدادات لو الإذن مرفوض
    print("✅ Notification permission requested.");
  }

  updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> getUserInfo() async {
    try {
      _name = await SharedPreferencesHelper.getData(
          SharedSharedPreferencesKeys.firsName);
      _phone = await SharedPreferencesHelper.getData(
          SharedSharedPreferencesKeys.phoneNumberKey);

      if (_name == null || _name.toString().trim().isEmpty) {
        DocumentSnapshot? documentSnapshot = await getDataFromDatabase();

        if (documentSnapshot!.exists && documentSnapshot.data() != null) {
          final data = documentSnapshot.data() as Map<String, dynamic>;

          _name = data['firstName']?.toString() ?? '';

          if (_name == null || _name.toString().trim().isEmpty) {
            _name = "user";
          }

          await SharedPreferencesHelper.saveData(
            key: SharedSharedPreferencesKeys.firsName,
            value: _name,
          );
        } else {
          _name = "Traveler";
          await SharedPreferencesHelper.saveData(
            key: SharedSharedPreferencesKeys.firsName,
            value: _name,
          );
        }
      }
    } catch (e) {
      debugPrint("❌ Error in getUserInfo: $e");
    }

    notifyListeners();
  }

  Future<DocumentSnapshot?> getDataFromDatabase() async {
    try {
      String? id = await SharedPreferencesHelper.getData(
          SharedSharedPreferencesKeys.userId);

      if (id == null || id.isEmpty) {
        throw Exception("User ID is null or empty");
      }

      return await FirebaseFirestore.instance
          .collection("users_development")
          .doc(id)
          .get();
    } catch (e) {
      debugPrint("❌ Error in getDataFromDatabase: $e");
      return null;
    }
  }

  initObjects() {
    HotelOrderWidgetStrategy();
    HotelAdminOrderWidgetAdminStrategy();
    CarOrderWidgetStrategy();
    CarAdminOrderWidgetStrategy();
    ActivityOrderWidgetStrategy();
    ActivityAdminOrderWidgetStrategy();
    HotelOrderFactory(); // تسجيل فئة حجز الفندق
    CarOrderFactory(); // تسجيل فئة حجز السيارة
    ActivityOrderFactory();
  }

  List<Widget> get userPages => [
        HomeScreenItem(
          name: _name,
          phoneNumber: _phone,
        ),
        const NotificationScreen(),
        const UserOrders(),
      ];

  List<Widget> get adminPages => [
        AddActivity(),
        AddHotel(),
        AddCarScreen(),
        GetOrdersScreen(),
      ];
}
