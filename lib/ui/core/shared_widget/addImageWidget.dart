import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';

Widget buildChooseImage({
  required Function openImage,
  required File? image,
}) {
  return GestureDetector(
    onTap: () async {
      await openImage();
    },
    child: Container(
      height: AppConstants.screenHeight * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFB2D9DB).withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: image == null ? Icon(
        Icons.add_a_photo,
        size: AppConstants.screenHeight * 0.06,
        color: Colors.grey,
      ) : Image.file(image,
        width: double.infinity,
        fit: BoxFit.fill,
        height: AppConstants.screenHeight * 0.24,
      ),
    ),
  );
}
