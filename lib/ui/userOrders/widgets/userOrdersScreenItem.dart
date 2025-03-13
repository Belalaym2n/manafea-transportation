import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/userOrders/widgets/tabController.dart';

import 'orderItem.dart';

class UserOrdersScreenItem extends StatefulWidget {
  const UserOrdersScreenItem({super.key});

  @override
  State<UserOrdersScreenItem> createState() => _UserOrdersScreenItemState();
}

class _UserOrdersScreenItemState extends State<UserOrdersScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        screenName(

        ),
        TabControllerItem(),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: OrderItem(),
            );
          },),
        )

      ],
    );
  }

  Widget screenName() {
    return Text(
      "Orders",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: AppConstants.screenWidth * 0.055,
        letterSpacing: 1.2,
        color: Colors.black87,
        overflow: TextOverflow.ellipsis,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}
