import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:manafea/config/appConstants.dart';

import '../../../domain/models/notificationModel/notificationModel.dart';

class GetNotificationService {
  // app id 9158013e-362c-4f0b-ae4b-576b4f1f670c
  static const String _apiUrl =
      'https://onesignal.com/api/v1/notifications';
  static String appId = AppConstants.oneSignalAppId;
  static String restApiKey = AppConstants.oneSignalApiKey;


   Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await http.get(
        Uri.parse('$_apiUrl?app_id=$appId'),
        headers: {
          'Authorization': 'Basic $restApiKey',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> notifications =
        json.decode(response.body)['notifications'];
        return notifications
            .where((json) {
          var externalIds = json['include_external_user_ids'];
          if (externalIds is List) {
            return !externalIds
                .contains("1234"); // استبعاد الإشعارات الخاصة بالمستخدم
          }
          return true; // إذا لم تكن القائمة موجودة، اعتبرها صالحة
        })
            .map((json) => NotificationModel.fromJson(json))
            .toList();
      } else {
        _logError(response.body, response.statusCode);
        throw Exception(
            'Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error in GetNotificationService: ${error.toString()}');
    }
  }

  void _logError(String responseBody, int statusCode) {
    print('Error fetching notifications: StatusCode = $statusCode');
    print('Response Body: $responseBody');
  }
}
