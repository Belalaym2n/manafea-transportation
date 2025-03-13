import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/userOrdersScreenItem.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: UserOrdersScreenItem(),
      ),
    ) ;
  }
}
