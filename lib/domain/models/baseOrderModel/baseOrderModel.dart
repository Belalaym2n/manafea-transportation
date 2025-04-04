class BaseOrder {
   String id;
  final String time;
  final double price;
  final String phoneNumber;
  final String name;
  final String userId;
  final String status;
  final String orderDate;

  BaseOrder({
    required this.id,
    required this.time,
    required this.price,
    required this.name,
    required this.userId,
    required this.status,
    required this.phoneNumber,
    required this.orderDate,
  });

  @override
  String toString() {
    return "Order ID: $id, Customer: $phoneNumber, Date: $orderDate";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'status': status,
      'userId': userId,
      'price': price,
      'name': name,
      'phoneNumber': phoneNumber,
      'orderDate': orderDate, // Convert DateTime to ISO 8601 string
    };
  }

  factory BaseOrder.fromJson(Map<String, dynamic> json) {
    return BaseOrder(
        status: json['status'],
        userId: json['userId'],
        name: json['name'],
        id: json['id'],
        time: json['time'],
        price: json['price'],
        phoneNumber: json['phoneNumber'],
        orderDate: json['orderDate'] // Convert ISO 8601 string back to DateTime
        );
  }
}

abstract class BaseOrderBuilder<T extends BaseOrder,
    B extends BaseOrderBuilder<T, B>> {
  String? id;
  String? phoneNumber;
  String? orderDate;
  String? time;
  String? name;
  double? price;
  String? userId;
  String? status;

  B setId(String id) {
    this.id = id;
    return this as B;
  }

  B setUserId(String userID) {
    this.userId = userID;
    return this as B;
  }

  B setStatus(String orderStatus) {
    this.status = orderStatus;
    return this as B;
  }

  B setName(String name) {
    this.name = name;
    return this as B;
  }

  B setPhoneNumber(String number) {
    phoneNumber = number;
    return this as B;
  }

  B setOrderDate(String date) {
    orderDate = date;
    return this as B;
  }

  B setPrice(double totalPrice) {
    price = totalPrice;
    return this as B;
  }

  B setTime(String bookingTime) {
    time = bookingTime;
    return this as B;
  }

  T build();
}
