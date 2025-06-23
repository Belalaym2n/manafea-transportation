import '../activityModel/requestActivityOrderModel.dart';
import '../carModels/requestCarBookingOrder.dart';
import '../hotelModels/requestHotelBooking.dart';
import 'baseOrderModel.dart';

abstract class OrderFactory {

  BaseOrder fromJson(Map<String, dynamic> json);
  String get serviceType;
}
class OrderFactoryRegistry {
  static final Map<String, OrderFactory> _factories = {};

  static void register(OrderFactory factory) {
    _factories[factory.serviceType] = factory;
  }

  static OrderFactory? getFactory(String serviceType) {
    return _factories[serviceType];
  }
}

class HotelOrderFactory extends OrderFactory {
  static final _instance = HotelOrderFactory._();

  factory HotelOrderFactory() {
    OrderFactoryRegistry.register(_instance);
    return _instance;
  }

  HotelOrderFactory._();  // Private constructor to ensure only one instance is used.

  @override
  String get serviceType => "Hotel Booking";

  @override
  BaseOrder fromJson(Map<String, dynamic> json) {
    return RequestHotelBooking.fromJson(json);
  }
}

class CarOrderFactory extends OrderFactory {
  static final _instance = CarOrderFactory._();

  factory CarOrderFactory() {
    OrderFactoryRegistry.register(_instance);
    return _instance;
  }

  CarOrderFactory._();  // Private constructor

  @override
  String get serviceType => "Car";

  @override
  BaseOrder fromJson(Map<String, dynamic> json) {
    return RequestCarBookingOrderModel.fromJson(json);
  }
}

class ActivityOrderFactory extends OrderFactory {
  static final _instance = ActivityOrderFactory._();

  factory ActivityOrderFactory() {
    OrderFactoryRegistry.register(_instance);
    return _instance;
  }

  ActivityOrderFactory._();  // Private constructor

  @override
  String get serviceType => "Activity";

  @override
  BaseOrder fromJson(Map<String, dynamic> json) {
    return RequestActivityOrderModel.fromJson(json);
  }
}
