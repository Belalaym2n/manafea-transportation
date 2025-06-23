import 'package:equatable/equatable.dart';

class NotificationsEntity extends Equatable {
  final String id;
  final String? name;
  final String? content;
  final String? heading;
  final bool canceled;
  final int successful;

  NotificationsEntity({
    required this.id,
    this.name,
    this.content,
    this.heading,
    required this.canceled,
    required this.successful,
  });

  @override
  List<Object?> get props => [id, name, content, heading, canceled, successful];

  factory NotificationsEntity.fromJson(Map<String, dynamic> json) {
    return NotificationsEntity(
      id: json['id'],
      name: json['name'],
      content: json['contents']?['en'],
      heading: json['headings']?['en'],
      canceled: json['canceled'] ?? false,
      successful: json['successful'] ?? 0,
    );
  }
}
