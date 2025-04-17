import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

import '../../../config/appConstants.dart';

class UserBookingData extends StatelessWidget {
  UserBookingData({
    super.key,
    this.phoneController,
    this.nameController,
  });

  final TextEditingController? nameController;
  final TextEditingController? phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟢 الحقل الأول - اسم المستخدم
          customTextFormField(
            controller: nameController ?? TextEditingController(),
            textInputType: TextInputType.text,
            hintText: "Enter your first name",
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name can't be empty";
              }

              return null;
            },
          ),
          SizedBox(height: AppConstants.screenHeight*0.025),

          // 🔵 الحقل الثاني - رقم الهاتف
          customTextFormField(
            controller: phoneController ?? TextEditingController(),
            textInputType: TextInputType.phone,
            hintText: "Enter your phone number",
            icon: Icons.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone number is required";
              }   final regex = RegExp(r'^05\d{8}$');
              if (!regex.hasMatch(value)) {
                return "Please enter a valid Saudi phone number like: 0501234567";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

Widget customTextFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String hintText,
  required IconData icon,
  String? Function(String?)? validator,
}) {
  return Center(
    child: SizedBox(
      width: double.infinity, // استخدام العرض الكامل
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        textAlign: TextAlign.start, // محاذاة النص لليسار بشكل أكثر احترافية
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize:            AppConstants.screenWidth*0.044,

          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Container(
            padding:   EdgeInsets.all( AppConstants.screenWidth*0.034),
            // decoration: BoxDecoration(
            //   color: AppColors.primaryColor.withOpacity(0.1),
            //   shape: BoxShape.circle,
            // ),
            child: Icon(icon, color: AppColors.primaryColor),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
            fontSize:  AppConstants.screenWidth*0.038,
          ),
          filled: true,
          fillColor: Colors.grey.shade100, // لون الخلفية الفاتح
          contentPadding:  EdgeInsets.symmetric(vertical:  AppConstants.screenHeight*0.022
              , horizontal:  AppConstants.screenWidth*0.05),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}



