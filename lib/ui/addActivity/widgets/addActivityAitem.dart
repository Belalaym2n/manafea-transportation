import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

import '../../../config/appConstants.dart';
import '../../../generated/locale_keys.g.dart';
import '../../core/commonScreen/chooseLocationPicker.dart';
import '../../core/shared_widget/addImageWidget.dart';
import '../../core/shared_widget/textFormFieldForAdmin.dart';

class AddActivityItem extends StatefulWidget {
  AddActivityItem(
      {super.key,
      required this.addActivity,
      required this.publicUrl,
      required this.openImage,
      required this.selectedDestination,
      required this.onChangedDestination,
      required this.image});

  final Future<dynamic> Function() openImage;
  File? image;
  String publicUrl;
  String? selectedDestination;
  final Function(String selectedValue, String locationLanguage)
      onChangedDestination;

  Future Function(ActivityModel) addActivity;

  @override
  State<AddActivityItem> createState() => _AddActivityItemState();
}

class _AddActivityItemState extends State<AddActivityItem> {
  TextEditingController activityNameController = TextEditingController();

  TextEditingController pricingController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController googleMapUrlController = TextEditingController();

  bool get areFieldsValid =>
      activityNameController.text.trim().isNotEmpty &&
      widget.selectedDestination.toString().trim().isNotEmpty &&
      widget.selectedDestination != null &&
      pricingController.text.trim().isNotEmpty &&
      descriptionController.text.trim().isNotEmpty &&
      googleMapUrlController.text.trim().isNotEmpty &&
      widget.image != null &&
      addressController.text.trim().isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen to changes
    activityNameController.addListener(_updateState);
    pricingController.addListener(_updateState);
    descriptionController.addListener(_updateState);
    addressController.addListener(_updateState);
    googleMapUrlController.addListener(_updateState);
  }

  void _updateState() => setState(() {});

  @override
  void dispose() {
    activityNameController.dispose();
    pricingController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    googleMapUrlController.dispose();
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
            buildChooseImage(image: widget.image, openImage: widget.openImage),
            SizedBox(height: AppConstants.screenHeight * 0.03),
            buildDestination(),
            SizedBox(height: AppConstants.screenHeight * 0.03),
            buildTextField("اسم الرحلة", controller: activityNameController),
            buildTextField("السعر",
                keyboardType: TextInputType.number,
                controller: pricingController),
            buildTextField("أبرز الأحداث",
                controller: descriptionController, maxLines: 3),
            buildTextField("عنوان التحرك", controller: addressController),
            buildTextField(" أضف رابط خرائط جوجل",
                controller: googleMapUrlController),
            SizedBox(height: AppConstants.screenHeight * 0.04),
            elevated_button(
              onPressed: areFieldsValid
                  ? () async {
                      try {
                        final activity = ActivityModelBuilder()
                            .setName(activityNameController.text)
                            .setAddress(addressController.text)
                            .setDescription(descriptionController.text)
                            .setPricing(int.parse(pricingController.text))
                            .setDescription(descriptionController.text)
                            .setGoogleMapsUrl(googleMapUrlController.text)
                            .build();
                        await widget.addActivity(activity);
                        activityNameController.clear();
                        pricingController.clear();
                        descriptionController.clear();
                        addressController.clear();
                      } catch (e) {
                        print("don't clear data ");
                      }
                    }
                  : () {
                      print("null");
                    },
              valid: areFieldsValid,
              buttonName: "إضافة رحلة",
            ),
            SizedBox(height: AppConstants.screenHeight * 0.04),
          ],
        ));
  }

  Widget buildDestination() {
    return InkWell(
      onTap: () => showLocationsPicker(
        context: context,
        changeLocation: widget.onChangedDestination,
        location: widget.selectedDestination,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppConstants.screenHeight * 0.015,
            horizontal: AppConstants.screenWidth * 0.04),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedDestination == null
                  ? "اختر الوجهة"
                  : widget.selectedDestination.toString(),
              style: TextStyle(
                  fontSize: AppConstants.screenWidth * 0.04,
                  // 4% من العرض
                  color: Colors.black54),
            ),
            Icon(Icons.arrow_drop_down_circle)
          ],
        ),
      ),
    );
  }
}
