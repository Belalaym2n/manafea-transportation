import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class RequestHotelBooking extends BaseOrder {
  final String roomType;
  final String checkIn;
  final String checkOut;
  final int roomCount;
  final String ? commonRoomTyp;

  RequestHotelBooking._({
    required String id,
    required String orderDate,
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
      this.commonRoomTyp ,
    required this.roomCount,
    required String time, // تم تمرير الوقت هنا
    required String name, // تم تمرير الوقت هنا
    required String service, // تم تمرير الوقت هنا
    required String userId, // تم تمرير الوقت هنا
    required String status, // تم تمرير الوقت هنا
    required double price, // تم تمرير السعر هنا
    required String phoneNumber, // تم تمرير رقم الهاتف هنا
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
        ); // تمرير القيم للـ super
  factory RequestHotelBooking.fromJson(Map<String, dynamic> json) {
    return RequestHotelBooking._(
      id: json['id']??'',
      checkOut: json['checkOut']??'',
      checkIn: json['checkIn']??'',
      orderDate: json['orderDate']??'',
      roomType: json['roomType']??'',
      roomCount: json['roomCount']??'',
      service: json['service']??'',
      time: json['time']??'',
      name: json['name']??'',
      userId: json['userId']??'',
      status: json['status']??'',
      price: (json['price'] as num).toDouble(),
      phoneNumber: json['phoneNumber']??'',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson(); // Get the BaseOrder JSON first
    json['roomType'] = roomType;
    json['roomCount'] = roomCount;
    json['checkIn'] = checkIn;
    json['checkOut'] = checkOut;
    if (commonRoomTyp != null) {
      json['commonRoomTyp'] = commonRoomTyp;
    }
    return json;
  }

}

class RequestHotelBookingBuilder
    extends BaseOrderBuilder<RequestHotelBooking,
        RequestHotelBookingBuilder> {
  String? roomType;
  int? roomCount;
  String? commonRoomTyp;
  String? checkOut;
  String? checkIn;

  RequestHotelBookingBuilder setRoomType(String roomType) {
    this.roomType = roomType;
    return this;
  }

  RequestHotelBookingBuilder setCheckIn(String checkInDate) {
    this.checkIn = checkInDate;
    return this;
  }
  RequestHotelBookingBuilder setCheckOut(String checkOutDate) {
    this.checkOut = checkOutDate;
    return this;
  }

  RequestHotelBookingBuilder setRoomCount(int roomCount) {
    this.roomCount = roomCount;
    return this;
  }
  RequestHotelBookingBuilder setCommonRoomTyp(String commonRoomTyp) {
    this.commonRoomTyp = commonRoomTyp;
    return this;
  }
  @override
  RequestHotelBooking build() {

    return RequestHotelBooking._(
      id: id??'sd',
      service:service??'',
      checkOut:checkOut??'',
      checkIn:checkIn??'',
      commonRoomTyp: commonRoomTyp,
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
