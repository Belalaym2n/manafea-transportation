import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

class RequestActivityOrderModel extends BaseOrder {

    int? peopleCount;
    String? activityName;
    String? googleMapsUrl;
    RequestActivityOrderModel._({
      required String id,
      required this.peopleCount,
      required String orderDate,
      required this.activityName,
      required this.googleMapsUrl,
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
  factory RequestActivityOrderModel.fromJson(Map<String, dynamic> json) {
    return RequestActivityOrderModel._(
      id: json['id'],
      googleMapsUrl: json['googleMapsUrl'],
      activityName: json['activityName'],
      peopleCount: json['peopleCount'],
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
    json['peopleCount'] = peopleCount;// Get the BaseOrder JSON first
    json['activityName'] = activityName;// Get the BaseOrder JSON first
    json['googleMapsUrl'] = googleMapsUrl;// Get the BaseOrder JSON first
    return json;
  }
}


class RequestActivityOrderBuilder extends  BaseOrderBuilder<RequestActivityOrderModel
, RequestActivityOrderBuilder>{

  int ?peopleCount;
  String? activityName;
  String? googleMapsUrl;

  RequestActivityOrderBuilder setPeopleCount(int peopleNumber){
    this.peopleCount=peopleNumber;
    return this;
  }
  RequestActivityOrderBuilder setGoogleMapsUrl(String url) {
    this.googleMapsUrl = url;
    return this;
  }
  RequestActivityOrderBuilder setActivityName(String activity) {
    this.activityName = activity;
    return this;
  }

  @override
  RequestActivityOrderModel build() {
    // TODO: implement build
    return  RequestActivityOrderModel._(
      id: id??'sd',
      googleMapsUrl: googleMapsUrl??'',
      peopleCount:peopleCount??1,
      activityName: activityName??'sd',
       service:service??'',
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
