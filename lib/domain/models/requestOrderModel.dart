class RequestOrderModel {
  final String name;
  final String phoneNumber;
  final String orderStatus;
  final String time;
  final String date;
  final String roomType;
  final String bookingType;
  final String? roomCount;
  final String? price;

  RequestOrderModel._({
    required this.name,
    required this.roomType,
    required this.bookingType,
    required this.phoneNumber,
    required this.orderStatus,
    required this.time,
    required this.date,
    this.roomCount,
    this.price,
  });

  static RequestOrderModelBuilder builder() => RequestOrderModelBuilder();

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "bookingType": bookingType,
      "orderStatus": orderStatus,
      "time": time,
      "roomType": roomType,
      "date": date,
      "roomCount": roomCount,
      "price": price,
    };
  }

  factory RequestOrderModel.fromJson(Map<String, dynamic> json) {
    return RequestOrderModel._(
      name: json["name"] ?? '',
      phoneNumber: json["phoneNumber"] ?? '',
      bookingType: json["bookingType"] ?? '',
      orderStatus: json["orderStatus"] ?? 'pending',
      time: json["time"] ?? '',
      date: json["date"] ?? '',
      roomType: json["roomType"] ?? '',
      roomCount: json["roomCount"],
      price: json["price"],
    );
  }
}

class RequestOrderModelBuilder {
  String? _name;
  String? _phoneNumber;
  String _orderStatus = 'pending';
  String? _time;
  String? _date;
  String? _bookingType;
  String? _roomCount;
  String? _roomType;
  String? _price;

  RequestOrderModelBuilder setName(String name) {
    _name = name;
    return this;
  }

  RequestOrderModelBuilder setOrderType(String bookingType) {
    _bookingType = bookingType;
    return this;
  }
  RequestOrderModelBuilder setRoomType(String roomType) {
    _roomType = roomType;
    return this;
  }

  RequestOrderModelBuilder setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    return this;
  }

  RequestOrderModelBuilder setTime(String time) {
    _time = time;
    return this;
  }

  RequestOrderModelBuilder setDate(String date) {
    _date = date;
    return this;
  }

  RequestOrderModelBuilder setRoomCount(String? roomCount) {
    _roomCount = roomCount;
    return this;
  }

  RequestOrderModelBuilder setPrice(String price) {
    _price = price;
    return this;
  }

  RequestOrderModel build() {
    return RequestOrderModel._(
      name: _name!,
      bookingType: _bookingType!,
      phoneNumber: _phoneNumber!,
      orderStatus: _orderStatus,
      time: _time!,
      date: _date!,
      roomType: _roomType!,
      roomCount: _roomCount,
      price: _price,
    );
  }
}
