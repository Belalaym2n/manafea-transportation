import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderStatusWidget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderStatusWidget.dart';

class TabControllerItem extends StatefulWidget {
  TabControllerItem({super.key});

  @override
  State<TabControllerItem> createState() => _TabControllerItemState();
}

class _TabControllerItemState extends State<TabControllerItem> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.all(3),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: (value) {
            indexSelected = value;
            setState(() {});
          },
          tabs: [
            OrderStatusWidget(
              statusName: 'Pending',
              isSelected: indexSelected == 0,
            ),
            OrderStatusWidget(
              statusName: 'Success',
              isSelected: indexSelected == 1,
            ),
            OrderStatusWidget(
              statusName: 'Failed',
              isSelected: indexSelected == 2,
            ),
            OrderStatusWidget(
              statusName: 'Cancel',
              isSelected: indexSelected == 3,
            ),
          ]),
    );
  }
}
