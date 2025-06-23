import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../../domain/models/carModels/requestCarBookingOrder.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../sharedOrdersWidget/carWidget.dart';
import '../orderItem/orderItem.dart';

class CarOrderWidgetStrategy extends OrderWidgetStrategy {
  static final _instance = CarOrderWidgetStrategy._();

  CarOrderWidgetStrategy._() {
    OrderWidgetStrategy.register(this);
  }

  factory CarOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestCarBookingOrderModel;

  @override
  Widget buildWidget(BaseOrder order, Function(String) cancelOrder) {
    final carOrder = order as RequestCarBookingOrderModel;

    return OrderItem(
       status: order.status,
      orderName: carOrder.carName ?? "Car",
      orderType: LocaleKeys.orders_screen_car.tr(),
      cancelOrder: cancelOrder,
      order: carOrder,
      orderDetailedChanged: buildCarOrderWidget(car: carOrder),
    );
  }
}

