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
import '../getOrdersItem.dart';

class HotelAdminOrderWidgetAdminStrategy extends OrderWidgetAdminStrategy {
  static final _instance = HotelAdminOrderWidgetAdminStrategy._();

  HotelAdminOrderWidgetAdminStrategy._() {
    OrderWidgetAdminStrategy.register(this);
  }

  factory HotelAdminOrderWidgetAdminStrategy() => _instance;

  @override
  bool canHandle(BaseOrder order) => order is RequestHotelBooking;

  @override
  Widget buildWidget(BaseOrder order, Function(String id, String status) updateStatus)
  {
    // TODO: implement buildWidget
  return  GetAdminOrdersItem(
updateStatus: updateStatus,
      orderName: order.name,
      orderType: LocaleKeys.orders_screen_hotel_nae.tr(),
      order: order,
      orderDetailedChanged: buildHotelWidget(hotel: order as RequestHotelBooking),
    );  }


}




