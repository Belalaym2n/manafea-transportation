import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/userModel/userModel.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

import '../../../../config/appColors.dart';
import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../core/shared_widget/textFormField.dart';

class UserPersonalDetailsItem extends StatefulWidget {
  UserPersonalDetailsItem({
    super.key,

    required this.uploadUserDat,
    required this.phoneNumber,
    required this.email,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final String? phoneNumber;
  final String? email;
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
              SizedBox(height: screenHeight *  0.06),
              buildTextFormFieldForAuth(
                controller: widget.firstNameController,
                hint: LocaleKeys.auth_first_name.tr(),
                errorValidator: LocaleKeys.errors_please_enter_firstname_and_lastname.tr(),

                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.01),
              buildTextFormFieldForAuth(
                controller: widget.lastNameController,
                hint: LocaleKeys.auth_last_name.tr(),
                errorValidator: LocaleKeys.errors_please_enter_firstname_and_lastname.tr(),
                screenWidth: screenWidth,
              ),
              const Spacer(),
              elevated_button(
                onPressed: () async {
                  String id =await SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.userId);

                  final user = UserModel.builder()
                      .setFirstName(widget.firstNameController.text)
                      .setLastName(widget.lastNameController.text)
                      .setPhoneNumber(widget.phoneNumber??'')
                      .setEmail(widget.email??"")
                  .setId(id)
                      .build();

                  if (isValid) widget.uploadUserDat(user: user);
                },
                valid: isValid,
                buttonName: LocaleKeys.buttons_name_next.tr(),
              ),
              SizedBox(height: screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildHeader(double screenWidth) {
    return Text(
      LocaleKeys.auth_personal_detail.tr(),
      style: TextStyle(
        color: Colors.black,
        fontSize: screenWidth * 0.07,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

