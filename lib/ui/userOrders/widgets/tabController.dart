import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderStatusWidget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderStatusWidget.dart';

class TabControllerItem extends StatefulWidget {
  TabControllerItem({super.key, required this.selectStatus});

  Function(String) selectStatus;

  @override
  State<TabControllerItem> createState() => _TabControllerItemState();
}

class _TabControllerItemState extends State<TabControllerItem> {
  int indexSelected = 0;

  List<String> status = [
    'Pending',
    'Success',
    'Failed',
    'Cancel',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        padding: EdgeInsets.only(
          left: 8
        ),
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelPadding: const EdgeInsets.all(3),
          overlayColor: MaterialStateProperty.
          all(Colors.transparent),
          onTap: (value) {
            indexSelected = value;
            setState(() {});
            widget.selectStatus(status[value])  ;
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

          ]),
    );
  }
}
