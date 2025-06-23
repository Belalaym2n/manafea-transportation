import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../../domain/models/carModels/requestCarBookingOrder.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../sharedOrdersWidget/carWidget.dart';
import '../getOrdersItem.dart';

class CarAdminOrderWidgetStrategy extends OrderWidgetAdminStrategy {
  static final _instance = CarAdminOrderWidgetStrategy._();

  CarAdminOrderWidgetStrategy._() {
    OrderWidgetAdminStrategy.register(this);
  }

  factory CarAdminOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestCarBookingOrderModel;

  @override
  Widget buildWidget(BaseOrder order ,Function(String id ,String status) updateStatus) {
    final carOrder = order as RequestCarBookingOrderModel;

    return GetAdminOrdersItem(
      updateStatus: updateStatus,

      orderName: carOrder.carName ?? "Car",
      orderType: LocaleKeys.orders_screen_car.tr(),
       order: carOrder,
      orderDetailedChanged: buildCarOrderWidget(car: carOrder),
    );
  }
}

