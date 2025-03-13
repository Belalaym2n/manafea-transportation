import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/home/view/homeScreen.dart';
import 'package:manafea/ui/login/view/loginScreen.dart';
import 'package:manafea/ui/notification/view/notifcationScreen.dart';

import '../../favorite/view/favoriteScreen.dart';
import '../../userOrders/view/userOrders.dart';

class BottomNavViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const NotificationScreen(),
    const UserOrders(),
  ];
}