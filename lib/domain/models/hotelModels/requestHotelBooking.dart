import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class RequestHotelBooking extends BaseOrder {
  final String roomType;
  final int roomCount;

  RequestHotelBooking._({
    required String id,
    required String orderDate,
    required this.roomType,
    required this.roomCount,
    required String time, // تم تمرير الوقت هنا
    required String name, // تم تمرير الوقت هنا
    required String userId, // تم تمرير الوقت هنا
    required String status, // تم تمرير الوقت هنا
    required double price, // تم تمرير السعر هنا
    required String phoneNumber, // تم تمرير رقم الهاتف هنا
  }) : super(
          id: id,
          name: name,
          time: time,
          status: status,
          userId: userId,
          price: price,
          phoneNumber: phoneNumber,
          orderDate: orderDate,
        ); // تمرير القيم للـ super
  factory RequestHotelBooking.fromJson(Map<String, dynamic> json) {
    return RequestHotelBooking._(
      id: json['id'],
      orderDate: json['orderDate'],
      roomType: json['roomType'],
      roomCount: json['roomCount'],
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
    final json = super.toJson(); // Get the BaseOrder JSON first
    json['roomType'] = roomType;
    json['roomCount'] = roomCount;
    return json;
  }
  // RequestHotelBooking copyWith({String? id}) {
  //   return RequestHotelBooking._(
  //     id: id ?? this.id,
  //     name: name,
  //     userId: userId,
  //     status: status,
  //     orderDate: orderDate,
  //     roomType: roomType,
  //     roomCount: roomCount,
  //     time: time,
  //     price: price,
  //     phoneNumber: phoneNumber,
  //   );
  // }
}

class RequestHotelBookingBuilder
    extends BaseOrderBuilder<RequestHotelBooking, RequestHotelBookingBuilder> {
  String? roomType;
  int? roomCount;

  RequestHotelBookingBuilder setRoomType(String roomType) {
    this.roomType = roomType;
    return this;
  }

  RequestHotelBookingBuilder setRoomCount(int roomCount) {
    this.roomCount = roomCount;
    return this;
  }

  @override
  RequestHotelBooking build() {

    return RequestHotelBooking._(
      id: id??'sd',
      name: name ?? 'sd',
      userId: userId ?? 'user',
      status: status ?? 'pending',
      orderDate: orderDate ?? '',
      roomType: roomType ?? 'not extis',
      roomCount: roomCount ?? 1,
      time: time ?? 'dfs',
      price: price ?? 5.8,
      phoneNumber: phoneNumber ?? 'dsf',
    );
  }


}
