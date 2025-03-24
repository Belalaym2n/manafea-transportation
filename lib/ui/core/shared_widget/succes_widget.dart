import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manafea/config/appConstants.dart';
import '../../../config/appColors.dart';

Widget done_order_widget(BuildContext context) {
  return SafeArea(

    child: Container(color: Colors.white,
      child: Stack(
        children: [
          // ✅ إضافة زر العودة للخلف
          Positioned(
            top: AppConstants.screenHeight * 0.02,
            left: AppConstants.screenWidth * 0.04,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryColor, size: 24),
              onPressed: () {
                Navigator.pop(context); // يرجع للخلف
              },
            ),
          ),

          // ✅ تصميم الشاشة الرئيسي
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppConstants.screenHeight * 0.12), // مسافة للزر العلوي
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width/1.3,
                      height: MediaQuery.of(context).size.height / 2,
                      child: LottieBuilder.asset(
                        "assets/jsonAnimations/successOrder.json",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.all(AppConstants.screenWidth * 0.04),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Your request has been successfully executed,\n"
                        "Our team will review it shortly and get in touch\n"
                        " with you within the next 30 minutes",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: AppConstants.screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
