import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../generated/locale_keys.g.dart';
import 'buildLocationWidget.dart';
import 'elevatedButton.dart';

Widget buildOrderHeader({
  required Widget orderInfo,
  required String orderId,
  required String price,
   required BuildContext context
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderId,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.screenWidth * 0.038,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                  "${LocaleKeys.orders_screen_total_price.tr()}:$price",
                  style: TextStyle(
                    fontSize: AppConstants.screenWidth * 0.032,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[700],
                  )
              ),
            ],
          ),
        ),
        GestureDetector(
            onTap: () {
              showDialog(
                useSafeArea: true,
                context: context,
                builder: (context) => orderInfo,
              );
            },
            child: Icon(Icons.info_outline_rounded,
                color: Colors.grey[700], size: 22)),
      ],
    ),
  );
}
Widget orderInfo({
  required BuildContext context,
  required String name,
  required String phoneNumber,
  required String time,
  String?url,
  required String orderType,
  required String orderName,
}) {
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    content: PhysicalModel(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.036),
      child: Container(
        height: AppConstants.screenHeight * 0.4 ,
        width: AppConstants.screenWidth * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.screenWidth * 0.044),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoDataWidget(LocaleKeys.orders_screen_name.tr(), name),
              infoDataWidget(LocaleKeys.orders_screen_phone.tr(), phoneNumber),
              infoDataWidget(LocaleKeys.orders_screen_time.tr(), time),
              infoDataWidget(LocaleKeys.orders_screen_payment_method.tr(), 'Cash'),
              infoDataWidget(orderType, orderName),
              openGoogleMaps(url??''),
              SizedBox(height: AppConstants.screenHeight * 0.02),
              elevated_button(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                buttonName: LocaleKeys.buttons_name_ok.tr(),
                valid: true,
                buttonSize: Size(
                  AppConstants.screenWidth,
                  AppConstants.screenHeight * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Widget infoDataWidget(String title, String data) {
  return Padding(
    padding:   EdgeInsets.symmetric(
        horizontal: AppConstants.screenWidth * 0.036
        , vertical: AppConstants.screenHeight * 0.008 ),
    child: Row(
      children: [
        Text(
          "$title:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.screenWidth * 0.038,
          ),
        ),
        SizedBox(width: AppConstants.screenWidth * 0.017 ),
        Expanded(
          child: Text(
            data,
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.036,
              color: AppColors.primaryColor, // Customize text color
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: false, // Avoid wrapping the text
          ),
        ),
      ],
    ),
  );
}
