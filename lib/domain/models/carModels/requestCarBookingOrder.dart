import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class RequestCarBookingOrderModel extends BaseOrder {
  String? carName;
  String? deliveryDate;
  String? receiptDate;
  String? deliveryLocation;

  RequestCarBookingOrderModel._({
    required String id,
    required String orderDate,
    required this.carName,
    required this.deliveryDate,
    required this.receiptDate,
    required this.deliveryLocation,
    required String time,
    required String name,
    required String service,
    required String userId,
    required String status,
    required double price,
    required String phoneNumber,
  }) : super(
          id: id,
          name: name,
          time: time,
          service: service,
          status: status,
          userId: userId,
          price: price,
          phoneNumber: phoneNumber,
          orderDate: orderDate,
        );

  // تمرير القيم للـ super
  factory RequestCarBookingOrderModel.fromJson(Map<String, dynamic> json) {
    return RequestCarBookingOrderModel._(
      id: json['id'],
      carName: json['carName'],
      deliveryLocation: json['deliveryLocation'],
      deliveryDate: json['deliveryDate'],
      receiptDate: json['receiptDate'],
      orderDate: json['orderDate'],
      service: json['service'],
      time: json['time'],
      name: json['name'],
      userId: json['userId'],
      status: json['status'],
      price: (json['price'] as num).toDouble(),
      // التأكد من التحويل إلى double
      phoneNumber: json['phoneNumber'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['carName'] = carName; // Get the BaseOrder JSON first
    json['receiptDate'] = receiptDate; // Get the BaseOrder JSON first
    json['deliveryLocation'] = deliveryLocation; // Get the BaseOrder JSON first
    json['deliveryDate'] = deliveryDate; // Get the BaseOrder JSON first
    return json;
  }
}

class RequestCarBookingOrderBuilder extends BaseOrderBuilder<
    RequestCarBookingOrderModel, RequestCarBookingOrderBuilder> {
  String? carName;
  String? receiptDate;
  String? deliveryDate;
  String? deliveryLocation;

  RequestCarBookingOrderBuilder setCarName(String car) {
    this.carName = car;
    return this;
  }

  RequestCarBookingOrderBuilder setDeliveryLocation(String location) {
    this.deliveryLocation = location;
    return this;
  }

  RequestCarBookingOrderBuilder setReceiptDate(String date) {
    this.receiptDate = date;
    return this;
  }
  RequestCarBookingOrderBuilder setDeliveryDate(String date) {
    this.deliveryDate = date;
    return this;
  }
  @override
  RequestCarBookingOrderModel build() {
    // TODO: implement build
    return RequestCarBookingOrderModel._(
      id: id ?? 'sd',
      deliveryDate: deliveryDate ?? 'sd',
      receiptDate: receiptDate ?? 'sd',
      deliveryLocation: deliveryLocation ?? 'sd',
      carName: carName ?? "",
      service: service ?? '',
      name: name ?? 'sd',
      userId: userId ?? 'user',
      status: status ?? 'pending',
      orderDate: orderDate ?? '',
      time: time ?? 'dfs',
      price: price ?? 5.8,
      phoneNumber: phoneNumber ?? 'dsf',
    );
  }
}
