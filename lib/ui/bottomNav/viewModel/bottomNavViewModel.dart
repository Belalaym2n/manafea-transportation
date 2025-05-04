import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
 import 'package:manafea/ui/home/view/homeScreenItem.dart';
 import 'package:manafea/ui/notification/view/notifcationScreen.dart';

import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../domain/models/baseOrderModel/orderFactoryForFromJson.dart';
import '../../activity/view/activityScreen.dart';
import '../../addCar/view/addCarScreen.dart';
import '../../addHotel/view/addHotel.dart';
import '../../userOrders/view/userOrders.dart';
import 'package:manafea/ui/userOrders/widgets/widgetsChangedInOrderItem/buildActivityWidget.dart';
import 'package:manafea/ui/userOrders/widgets/widgetsChangedInOrderItem/buildCarWidget.dart';
import 'package:manafea/ui/userOrders/widgets/widgetsChangedInOrderItem/buildHotelBookingOrderDetailec.dart';
 class BottomNavViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  String? _name;
  String? _phone;

  String? get  name=>_name;
  String? get  phone=>_phone;
  int get selectedIndex => _selectedIndex;

  updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  getUserIfo() async {
    _name =await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.firsName
    );
    _phone =await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.phoneNumberKey
    );
    notifyListeners(); // 👈 مهم

  }
  initObjects(){
    HotelOrderWidgetStrategy();
    CarOrderWidgetStrategy();
    ActivityOrderWidgetStrategy();
    HotelOrderFactory();  // تسجيل فئة حجز الفندق
    CarOrderFactory();    // تسجيل فئة حجز السيارة
    ActivityOrderFactory();
  }
  List<Widget> get userPages => [

    HomeScreenItem(name: _name,

    phoneNumber: _phone,),

     const NotificationScreen(),
    const UserOrders(),
  ];

  List<Widget> adminPages=[
    const AddActivity(),
    const AddCarScreen(),
    const AddHotel(),
  ];
}
