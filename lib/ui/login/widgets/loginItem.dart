import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';
import '../../../routing/appRoutes.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../../core/shared_widget/textFormField.dart';

class LoginItem extends StatefulWidget {
  const LoginItem({super.key});

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool isLoading = false;
  bool isValid = false;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isValid = controller.text.isNotEmpty; // التحقق من أن النص ليس فارغًا
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: enter_number_text()),
                SizedBox(
                  height: 35,
                ),
                saudi_flag(),
                SizedBox(
                  height: 55,
                ),
                textFormField(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: elevated_button(
                      valid: isValid,
                      onPressed: () {
                        isValid?
                        Navigator.pushNamed(context, AppRoutes.verifyScreen)
                       :null;
                      },
                      buttonName: "Next"),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )));
  }

  textFormField() {
    return Center(
      child: SizedBox(
        width: 250, // تقليل العرض ليكون متناسقًا
        child: TextFormField(
          controller: controller,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.screenWidth * 0.08),
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          // جعل النص في المنتصف
          decoration: InputDecoration(
            hintText: "+966 50 123 4567",
            // مثال رقم الجوال
            hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.screenWidth * 0.08),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey.shade400, width: 1.5), // خط رمادي خفيف
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.lightBlack , width: 2), // خط أخضر عند التركيز
            ),
          ),
        ),
      ),
    );
  }

  enter_number_text() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          'Enter Mobile Number',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: AppConstants.screenWidth * 0.07),
        ),
      ],
    );
  }

  saudi_flag() {
    return Container(
      height: 35,
      width: AppConstants.screenWidth * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 10,
          ),
          CountryFlag.fromCountryCode(
            'SA', // كود السعودية
            width: 40,
            height: 25,
            shape: Rectangle(),
            // حواف ناعمة
          ),
          const SizedBox(width: 8), // مسافة بين العلم والرقم
          Text(
            "+966",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
