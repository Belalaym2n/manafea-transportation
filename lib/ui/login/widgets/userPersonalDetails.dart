import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

class UserPersonalDetails extends StatefulWidget {
  const UserPersonalDetails({super.key});

  @override
  State<UserPersonalDetails> createState() => _UserPersonalDetailsState();
}

class _UserPersonalDetailsState extends State<UserPersonalDetails> {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  bool isValid=false;
  @override
  void initState() {
    super.initState();
    updateValidation();

    firstNameController.addListener(updateValidation);
    lastNameController.addListener(updateValidation);
  }
  void updateValidation() {
    setState(() {
      isValid = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(child:
          _buildIntro()),
          SizedBox(
            height: 50,
          ),
          _buildTextFormField(
            controller: firstNameController,
            hint: 'First Name'
          ),
          _buildTextFormField(
            controller: lastNameController,
              hint: 'Last Name'
          ),

          SizedBox(
            height: 50,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30.0),
            child: elevated_button(onPressed: (){
              Navigator.pushNamed(context, AppRoutes.bottomNav);
            },
                valid: isValid ,
                buttonName: "Next"),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ));

  }

  _buildTextFormField({
    required String hint,
    required TextEditingController controller,
}){

      return Center(
        child: SizedBox(
          width: 280, // تقليل العرض ليكون متناسقًا
          child: TextFormField(
controller: controller,
            style: TextStyle(

                fontWeight: FontWeight.w700,
                fontSize: AppConstants.screenWidth * 0.05),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,

            // جعل النص في المنتصف
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
              hintText: hint,
              // مثال رقم الجوال
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w700,
                  fontSize: AppConstants.screenWidth * 0.05),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.shade400, width: 1.5), // خط رمادي خفيف
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.lightBlack , width: 2), // خط أخضر عند التركيز
              ),
            ),
          ),
        ),
      );


  }

  _buildIntro(){
    return const Text(
      'Personal Detail',
      style: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
