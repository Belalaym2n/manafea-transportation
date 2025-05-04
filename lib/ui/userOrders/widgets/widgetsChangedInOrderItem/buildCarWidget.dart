import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/appConstants.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../../domain/models/carModels/requestCarBookingOrder.dart';
import '../../../../generated/locale_keys.g.dart';
import '../orderItem/orderItem.dart';
import 'buildHotelBookingOrderDetailec.dart';

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
      orderName: carOrder.carName ?? "Car",
      orderType: LocaleKeys.orders_screen_car.tr(),
      cancelOrder: cancelOrder,
      order: carOrder,
      orderDetailedChanged: buildCarOrderWidget(car: carOrder),
    );
  }
}

Widget buildCarOrderWidget({required RequestCarBookingOrderModel car}) {
  return buildOrderWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.orders_screen_car.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.screenWidth * 0.038,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: AppConstants.screenHeight * 0.012),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDateWidget(
                dataValue: car.deliveryDate.toString(),
                dateName: LocaleKeys.car_screen_delivery.tr()),
            buildDateWidget(
                dateName: LocaleKeys.car_screen_receipt.tr(), dataValue: car.receiptDate.toString())
          ],
        ),
        SizedBox(height: AppConstants.screenHeight * 0.018),
      ],
    ),
  );
}
