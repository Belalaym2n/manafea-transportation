import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

class UserBookingData extends StatelessWidget {
  const UserBookingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟢 الحقل الأول
          const CustomTextField(
            textInputType: TextInputType.text,
            label: "First Name",
            hintText: "Enter your first name",
            icon: Icons.person,
          ),
          const SizedBox(height: 20),

          // 🔵 الحقل الثاني
          const CustomTextField(
            textInputType: TextInputType.number,
            label: "Phone Number",
            hintText: "Enter your phone number",
            icon: Icons.phone,
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
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.textInputType,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:textInputType ,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: AppColors.primaryColor),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              color: AppColors.primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
