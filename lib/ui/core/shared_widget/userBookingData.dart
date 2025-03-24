import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

class UserBookingData extends StatelessWidget {
  const UserBookingData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16), // مسافة خارجية
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟢 الحقل الأول
          CustomTextField(
            label: "First Name",
            hintText: "Enter your first name",
            icon: Icons.person,
          ),
          SizedBox(height: 16), // مسافة بين الحقول

          // 🔵 الحقل الثاني
          CustomTextField(
            label: "Phone Number",
            hintText: " Phone Number",
            icon: Icons.person_outline,
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;

  const CustomTextField({
    required this.label,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label, // اسم الحقل
        hintText: hintText, // نص المساعدة
        prefixIcon: Icon(icon, color: AppColors.primaryColor), // أيقونة الإدخال
        filled: true,
        fillColor: Colors.grey.shade100, // خلفية خفيفة للحقل
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // زوايا ناعمة
          borderSide: BorderSide.none, // إزالة الإطار الافتراضي
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }
}
