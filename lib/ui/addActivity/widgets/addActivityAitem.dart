import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/appConstants.dart';
import '../../core/shared_widget/addImageWidget.dart';
import '../../core/shared_widget/textFormFieldForAdmin.dart';

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

            buildChooseImage(
              image: widget.image,
              openImage:   widget.openImage
            ),
            SizedBox(height: AppConstants.screenHeight * 0.03),

             buildTextField("الوجهة", controller: destinationController),

             buildTextField("اسم الرحلة", controller: activityNameController),

             buildTextField("السعر", keyboardType: TextInputType.number,
                controller: pricingController),

             buildTextField("أبرز الأحداث",
                controller: descriptionController,
                maxLines: 3),

             buildTextField("عنوان التحرك",
                controller: addressController),

            SizedBox(height: AppConstants.screenHeight * 0.04),


             elevated_button(onPressed: areFieldsValid ? () async {
               try{
                 final activity =
                 ActivityModelBuilder().
                 setName(activityNameController.text)
                     .setAddress(addressController.text)
                     .setDescription( descriptionController.text)
                     .setImageUrl(widget.publicUrl)
                     .setDestination("fff")
                     .setPricing(int.parse(pricingController.text))
                     .setDescription(destinationController.text)
                     .build();
                 print("url ${widget.publicUrl}");
                 await   widget.addActivity(activity);
                 activityNameController.clear();
                 destinationController.clear();
                 pricingController.clear();
                 descriptionController.clear();
                 addressController.clear();
               }catch(e){
                 print(e.toString());
               }

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


}
