import 'package:flutter/cupertino.dart';

import 'baseOrderModel.dart';

abstract class OrderWidgetStrategy {
  static final List<OrderWidgetStrategy> _strategies = [];

  static void register(OrderWidgetStrategy strategy) {
    _strategies.add(strategy);
  }

  static List<OrderWidgetStrategy> get strategies => _strategies;

  static OrderWidgetStrategy? getStrategy(BaseOrder order) {
    try {
      return _strategies.firstWhere((s) => s.canHandle(order));
    } catch (_) {
      return null;
    }
  }

  bool canHandle(BaseOrder order);
  Widget buildWidget(BaseOrder order,  Function(String) cancelOrder
      );
}