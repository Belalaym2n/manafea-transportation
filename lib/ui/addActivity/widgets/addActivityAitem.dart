import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/appConstants.dart';

class AddActivityItem extends StatefulWidget {
  AddActivityItem({super.key,
    required this.addActivity,
    required this.publicUrl,
    required this.openImage, required this.image});

  final Future<dynamic> Function() openImage;
  File ? image;
  String   publicUrl;

  Future Function(ActivityModel) addActivity;

  @override
  State<AddActivityItem> createState() => _AddActivityItemState();
}

class _AddActivityItemState extends State<AddActivityItem> {
  TextEditingController destinationController = TextEditingController();

  TextEditingController activityNameController = TextEditingController();

  TextEditingController pricingController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  bool get areFieldsValid =>
      destinationController.text.trim().isNotEmpty &&
          activityNameController.text.trim().isNotEmpty &&
          pricingController.text.trim().isNotEmpty &&
          descriptionController.text.trim().isNotEmpty &&
          widget.image != null &&
          addressController.text.trim().isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen to changes
    destinationController.addListener(_updateState);
    activityNameController.addListener(_updateState);
    pricingController.addListener(_updateState);
    descriptionController.addListener(_updateState);
    addressController.addListener(_updateState);
  }

  void _updateState() => setState(() {});

  @override
  void dispose() {
    destinationController.dispose();
    activityNameController.dispose();
    pricingController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.screenWidth * 0.05,
          vertical: AppConstants.screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            buildChooseImage(),
            SizedBox(height: AppConstants.screenHeight * 0.03),

            // الوجهة
            _buildTextField("الوجهة", controller: destinationController),

            // اسم الرحلة
            _buildTextField("اسم الرحلة", controller: activityNameController),

            // السعر
            _buildTextField("السعر", keyboardType: TextInputType.number,
                controller: pricingController),

            // أبرز الأحداث
            _buildTextField("أبرز الأحداث",
                controller: descriptionController,
                maxLines: 3),

            // عنوان التحرك
            _buildTextField("عنوان التحرك",
                controller: addressController),

            SizedBox(height: AppConstants.screenHeight * 0.04),


            // زر الحفظ
            elevated_button(onPressed: areFieldsValid ? () async {
              ActivityModel activity =
              ActivityModel(
                  name: activityNameController.text,
                  description: descriptionController.text,
                  imageUrl: widget.publicUrl,
                  pricing: int.parse(pricingController.text),
                  destination: destinationController.text,
                  address: addressController.text);
              print("url ${widget.publicUrl}");
              await   widget.addActivity(activity);
              activityNameController.clear();
              destinationController.clear();
              pricingController.clear();
              descriptionController.clear();
              addressController.clear();
            } : () {
              print("null");
            },
              valid:  areFieldsValid,
              buttonName: "Save Activity",

            ),
            SizedBox(height: AppConstants.screenHeight * 0.04),

          ],

        ));
  }

  Widget buildChooseImage() {
    return GestureDetector(
      onTap: () async {
        await widget.openImage();
      },
      child: Container(
        height: AppConstants.screenHeight * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFB2D9DB).withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.03),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: widget.image == null ? Icon(
          Icons.add_a_photo,
          size: AppConstants.screenHeight * 0.06,
          color: Colors.grey,
        ) : Image.file(widget.image!,
          width: double.infinity,
          fit: BoxFit.fill,
          height: AppConstants.screenHeight * 0.24,
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
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
}
