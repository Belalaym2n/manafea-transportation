import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/carModels/requestCarBookingOrder.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import '../../../../../config/appConstants.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../../generated/locale_keys.g.dart';

import '../../../sharedOrdersWidget/hotelWidget.dart';
import '../orderItem/orderItem.dart';

class HotelOrderWidgetStrategy extends OrderWidgetStrategy {
  static final _instance = HotelOrderWidgetStrategy._();

  HotelOrderWidgetStrategy._() {
    OrderWidgetStrategy.register(this);
  }

  factory HotelOrderWidgetStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestHotelBooking;

  @override
  Widget buildWidget(BaseOrder order, Function(String) cancelOrder) {
    return OrderItem(
      status: order.status,

      orderName: order.name,
      orderType: LocaleKeys.orders_screen_hotel_nae.tr(),
      cancelOrder: cancelOrder,
      order: order,
      orderDetailedChanged: buildHotelWidget(hotel: order as RequestHotelBooking),
    );
  }
}




