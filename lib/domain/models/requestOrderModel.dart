import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class RequestOrderModel extends BaseOrder{


  final String roomType;
  final String checkIn;
  final String checkOut;
  final int roomCount;
  final String ? commonRoomTyp;

  RequestOrderModel({
    required String id,
      String? orderDate,
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
    this.commonRoomTyp ,
    required this.roomCount,
    required String time, // تم تمرير الوقت هنا
    required String name, // تم تمرير الوقت هنا
    required String service, // تم تمرير الوقت هنا
      String? userId, // تم تمرير الوقت هنا
      String? status, // تم تمرير الوقت هنا
    required double price, // تم تمرير السعر هنا
    required String phoneNumber, // تم تمرير رقم الهاتف هنا
  }) : super(
    id: id,
    name: name,
    time: time,
    service: service,
    status: status??"",
    userId: userId??"",
    price: price,
    phoneNumber: phoneNumber,
    orderDate: orderDate??'',
  ); // تمرير القيم للـ super
  factory RequestOrderModel.fromJson(Map<String, dynamic> json) {
    return RequestOrderModel(
      id: json['id'],
      checkOut: json['checkOut'],
      checkIn: json['checkIn'],
      orderDate: json['orderDate'],
      roomType: json['roomType'],
      roomCount: json['roomCount'],
      service: json['service'],
      time: json['time'],
      name: json['name'],
      userId: json['userId'],
      status: json['status'],
      price: (json['price'] as num).toDouble(),

      phoneNumber: json['phoneNumber'],
    );
  }

}

