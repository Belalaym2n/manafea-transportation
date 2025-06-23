import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/requestActivityOrderModel.dart';

import '../../../../../config/appConstants.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../../generated/locale_keys.g.dart';

import '../../../sharedOrdersWidget/activityWidget.dart';
import '../getOrdersItem.dart';

class ActivityAdminOrderWidgetStrategy extends OrderWidgetAdminStrategy {
  static final _instance = ActivityAdminOrderWidgetStrategy._();

  ActivityAdminOrderWidgetStrategy._() {
    OrderWidgetAdminStrategy.register(this);
  }

  factory ActivityAdminOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestActivityOrderModel;

  @override
  Widget buildWidget(BaseOrder order ,Function(String id,String status )
  updateStatus
      ) {
    final activityOrder = order as RequestActivityOrderModel;

    return GetAdminOrdersItem(
      updateStatus: updateStatus,

      orderName: activityOrder.activityName ?? "Activity",
      orderType: LocaleKeys.orders_screen_activity.tr(),
       order: activityOrder,
      orderDetailedChanged: orderActivityWidget(order: activityOrder),
    );
  }
}

