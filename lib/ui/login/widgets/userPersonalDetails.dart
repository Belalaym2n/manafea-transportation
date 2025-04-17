import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/userModel.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

import '../../../config/appColors.dart';

class UserPersonalDetailsItem extends StatefulWidget {
  UserPersonalDetailsItem({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.uploadUserDat,
    required this.phoneNumber,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final String phoneNumber;
  final Function({required UserModel user}) uploadUserDat;

  @override
  State<UserPersonalDetailsItem> createState() =>
      _UserPersonalDetailsItemState();
}

class _UserPersonalDetailsItemState extends State<UserPersonalDetailsItem> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    updateValidation();

    widget.firstNameController.addListener(updateValidation);
    widget.lastNameController.addListener(updateValidation);
  }

  void updateValidation() {
    setState(() {
      isValid = widget.firstNameController.text.isNotEmpty &&
          widget.lastNameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.firstNameController.dispose();
    widget.lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.1;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:
          horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.06),
              _buildHeader(screenWidth),
              SizedBox(height: screenHeight * 0.06),
              _buildTextFormField(
                controller: widget.firstNameController,
                hint: 'First Name',
                errorValidator: 'Please Enter First Name',
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.01),
              _buildTextFormField(
                controller: widget.lastNameController,
                hint: 'Last Name',
                errorValidator: 'Please Enter Last Name',
                screenWidth: screenWidth,
              ),
              const Spacer(),
              elevated_button(
                onPressed: () {
                  final user = UserModel.builder()
                      .setFirstName(widget.firstNameController.text)
                      .setLastName(widget.lastNameController.text)
                      .setPhoneNumber(widget.phoneNumber)
                      .build();

                  if (isValid) widget.uploadUserDat(user: user);
                },
                valid: isValid,
                buttonName: "Next",
              ),
              SizedBox(height: screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String hint,
    required TextEditingController controller,
    required double screenWidth,
    required String errorValidator  ,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorValidator;
        }
        return null;
      },
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: screenWidth * 0.05,
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.person),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w700,
          fontSize: screenWidth * 0.05,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlack, width: 2),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Text(
      'Personal Detail',
      style: TextStyle(
        color: Colors.black,
        fontSize: screenWidth * 0.07,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
