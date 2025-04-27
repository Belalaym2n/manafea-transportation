
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';

Widget buildTextField(String label,
    {
      required TextEditingController controller,
      TextInputType keyboardType =
          TextInputType.text, int maxLines = 1}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppConstants.screenHeight * 0.025),
    child: TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: AppConstants.screenHeight * 0.02,
          color: Colors.grey[700],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              AppConstants.screenWidth * 0.02),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE3652F), width: 1.5),
          borderRadius: BorderRadius.circular(
              AppConstants.screenWidth * 0.02),
        ),
      ),
    ),
  );
}