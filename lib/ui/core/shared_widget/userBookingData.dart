import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import '../../../config/appConstants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/generated/locale_keys.g.dart';  // Make sure you import this

class UserBookingData extends StatelessWidget {
  UserBookingData({
    super.key,
    this.phoneController,
    this.nameController,
  });

  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets, // لتعديل المسافة بين الحواف عند ظهور الكيبورد
      duration: const Duration(milliseconds: 150), // يمكن تعديل المدة لتصبح أسرع أو أبطأ
      curve: Curves.easeInOut, // يمكن استخدام انحناء سلس
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.055, vertical: AppConstants.screenHeight * 0.012),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextFormField(
                controller: nameController ?? TextEditingController(),
                textInputType: TextInputType.text,
                hintText: LocaleKeys.form_name_hint.tr(),
                icon: Icons.person,
                focusNode: nameFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.form_name_empty.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppConstants.screenHeight * 0.025),
              customTextFormField(
                controller: phoneController ?? TextEditingController(),
                textInputType: TextInputType.phone,
                hintText: LocaleKeys.form_phone_hint.tr(),
                focusNode: phoneFocusNode,
                icon: Icons.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.form_phone_empty.tr();
                  }
                   
                  return null;
                },
              ),
            ],
          ),
        ),
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
  FocusNode? focusNode,
}) {
  return Center(
    child: SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType,
        textAlign: TextAlign.start,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppConstants.screenWidth * 0.044,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.all(AppConstants.screenWidth * 0.034),
            child: Icon(icon, color: AppColors.primaryColor),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
            fontSize: AppConstants.screenWidth * 0.038,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppConstants.screenHeight * 0.022,
            horizontal: AppConstants.screenWidth * 0.05,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
          ),
        ),
      ),
    ),
  );
}
