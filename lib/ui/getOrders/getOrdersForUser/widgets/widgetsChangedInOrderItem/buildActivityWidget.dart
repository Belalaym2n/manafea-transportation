import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';

import '../../../../../config/appConstants.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../../generated/locale_keys.g.dart';

import '../../../sharedOrdersWidget/activityWidget.dart';
import '../orderItem/orderItem.dart';

class ActivityOrderWidgetStrategy extends OrderWidgetStrategy {
  static final _instance = ActivityOrderWidgetStrategy._();

  ActivityOrderWidgetStrategy._() {
    OrderWidgetStrategy.register(this);
  }

  factory ActivityOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestActivityOrderModel;

  @override
  Widget buildWidget(BaseOrder order, Function(String) cancelOrder) {
    final activityOrder = order as RequestActivityOrderModel;

    return OrderItem(
      url: order.googleMapsUrl.toString()??'',
      status: order.status,
      orderName: activityOrder.activityName ?? "Activity",
      orderType: LocaleKeys.orders_screen_activity.tr(),
      cancelOrder: cancelOrder,
      order: activityOrder,
      orderDetailedChanged: orderActivityWidget(order: activityOrder),
    );
  }
}

