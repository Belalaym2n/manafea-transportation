import 'package:dio/dio.dart';

import '../appConstants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  static const String _apiUrl = 'https://onesignal.com/api/v1/notifications';
  static String appId = AppConstants.oneSignalAPPID;
  static String restApiKey = AppConstants.oneSignalApiKey;

  Future<Response> getNotification( ) {
   return dio.get("$_apiUrl?app_id=$appId",
        options: Options(headers: {
          'Authorization': 'Basic $restApiKey',
          'Content-Type': 'application/json',
        }));
  }
}
