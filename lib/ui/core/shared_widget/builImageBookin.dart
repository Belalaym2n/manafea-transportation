import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

Widget buildBookingImage({
  required String imagePath,
  required String imageName,
}) {
  return Container(
    height: AppConstants.screenHeight * 0.25,
    width: AppConstants.screenWidth,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(

      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius:   BorderRadius.only(
        bottomRight: Radius.circular(AppConstants.screenWidth*0.062),
        bottomLeft: Radius.circular(AppConstants.screenWidth*0.062),
      ),
      child: Stack(
        children: [
          /// صورة الفندق
          Image.network(
            imagePath,
            fit: BoxFit.cover,
            height: AppConstants.screenHeight*0.25,
            width: AppConstants.screenWidth,
          ),

           Container(
            color: Colors.black.withOpacity(0.2),
          ),

           Positioned(top: AppConstants.screenHeight*0.016,
               left: 12, child: _buildIconBack()),

          /// اسم الفندق في المنتصف
          Positioned(
            left: 0,
            right: 0,
            bottom: AppConstants.screenHeight * 0.02,
            child: Center(
              child: Text(
                imageName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildIconBack() {
  return Container(
    width: AppConstants.screenWidth * 0.09,
    height: AppConstants.screenWidth * 0.09,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withOpacity(0.9),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: AppConstants.screenWidth * 0.045,
        color: AppColors.primaryColor,
      ),
      splashRadius: AppConstants.screenWidth * 0.05,
    ),
  );
}

