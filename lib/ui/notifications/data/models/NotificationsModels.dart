import 'package:equatable/equatable.dart';

import '../../domain/entities/notificationEntity.dart';

class NotificationsModel extends NotificationsEntity {
  NotificationsModel({
    required super.id,
    super.name,
    super.content,
    super.heading,
    required super.canceled,
    required super.successful,
    this.message,
  });

  String? message;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'],
      name: json['name'],
      content: json['contents']?['en'],
      heading: json['headings']?['en'],
      canceled: json['canceled'] ?? false,
      successful: json['successful'] ?? 0,
      message: json['message'],  // مثال على إضافة خاصية إضافية
    );
  }

  @override
  List<Object?> get props => [super.props, message];

  // Optional: ToJson إذا كنت بحاجة إلى تحويل البيانات مرة أخرى
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contents': {'en': content},
      'headings': {'en': heading},
      'canceled': canceled,
      'successful': successful,
      'message': message,
    };
  }
}
