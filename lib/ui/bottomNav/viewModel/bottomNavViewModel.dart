import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
 import 'package:manafea/ui/home/view/homeScreenItem.dart';
 import 'package:manafea/ui/notification/view/notifcationScreen.dart';

import '../../activity/view/activityScreen.dart';
import '../../addCar/view/addCarScreen.dart';
import '../../addHotel/view/addHotel.dart';
import '../../userOrders/view/userOrders.dart';

class BottomNavViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> userPages = [
    const HomeScreenItem(),
     const NotificationScreen(),
    const UserOrders(),
  ];

  List<Widget> adminPages=[
    const AddActivity(),
    const AddCarScreen(),
    const AddHotel(),
  ];
}
