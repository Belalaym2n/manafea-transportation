import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

import '../../../config/appConstants.dart';

class AddActivityItem extends StatefulWidget {
  const AddActivityItem({super.key});

  @override
  State<AddActivityItem> createState() => _AddActivityItemState();
}

class _AddActivityItemState extends State<AddActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('إضافة نشاط جديد',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.screenWidth * 0.05,
          vertical: AppConstants.screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             GestureDetector(
              onTap: () {
                // TODO: pick image
              },
              child: Container(
                height: AppConstants.screenHeight * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFB2D9DB).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Icon(
                  Icons.add_a_photo,
                  size: AppConstants.screenHeight * 0.06,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: AppConstants.screenHeight * 0.03),

            // الوجهة
            _buildTextField("الوجهة"),

            // اسم الرحلة
            _buildTextField("اسم الرحلة"),

            // السعر
            _buildTextField("السعر", keyboardType: TextInputType.number),

            // أبرز الأحداث
            _buildTextField("أبرز الأحداث", maxLines: 3),

            // عنوان التحرك
            _buildTextField("عنوان التحرك"),

            SizedBox(height: AppConstants.screenHeight * 0.04),

            // زر الحفظ
            SizedBox(
              width: double.infinity,
              height: AppConstants.screenHeight * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00456B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.02),
                  ),
                ),
                onPressed: () {
                  // TODO: Save Activity
                },
                child: Text(
                  "حفظ النشاط",
                  style: TextStyle(
                    fontSize: AppConstants.screenHeight * 0.022,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.screenHeight * 0.025),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: AppConstants.screenHeight * 0.02,
            color: Colors.grey[700],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.02),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE3652F), width: 1.5),
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.02),
          ),
        ),
      ),
    );
  }
}