import 'package:flutter/cupertino.dart';

class AppConstants{
  static const String base_url = "https://accept.paymob.com/api";
  static const String auth_taken_enpoint = "/auth/tokens";
  static const String order_id_enpoint = "/ecommerce/orders";
  static const String oneSignalAPIURL = "https://onesignal.com/api/v1/notifications";

  static const appId = 1362999457;
  static const appSign =
      'e4e456c1a7e52109c3f05361598149731f15d42fe55697425f68db7d70ae89b7';
  static String oneSignalAppId =
      "9158013e-362c-4f0b-ae4b-576b4f1f670c";
  static String oneSignalApiKey =
      "os_v2_app_sfmacprwfrhqxlslk5vu6h3hbqthly2gav5u4efd7yyvunvnnnuhpdkrulwrnuznyu7f5hamuxi3xajkmyykrow7lemrx6yzrqbc7fa";

  static const String imageUrl="assets/images/";
  static late double screenHeight;
  static late double screenWidth;

  static void initSize(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}
