import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';
 import 'package:manafea/ui/home/widgets/homeScreenItem.dart';
 import 'package:manafea/ui/notification/view/notifcationScreen.dart';

import '../../activity/view/activityScreen.dart';
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
    const ActivityScreen(),
    const NotificationScreen(),
    const UserOrders(),
  ];

  List<Widget> adminPages=[
    AddActivity(),
    const ActivityScreen(),
    const HomeScreenItem(),

  ];
}
