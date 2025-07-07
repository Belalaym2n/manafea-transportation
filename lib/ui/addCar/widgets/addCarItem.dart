import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';

import '../../../config/appConstants.dart';
import '../../../domain/models/activityModel/activityModel.dart';
import '../../core/shared_widget/addImageWidget.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../../core/shared_widget/textFormFieldForAdmin.dart';

class AddCarItem extends StatefulWidget {
  AddCarItem(
      {super.key,
      required this.addCar,
      required this.publicUrl,
      required this.openImage,
      required this.image});

  final Future<dynamic> Function() openImage;
  File? image;
  String publicUrl;

  Future Function(String, String, String) addCar;

  @override
  State<AddCarItem> createState() => _AddCarItemState();
}

class _AddCarItemState extends State<AddCarItem> {
  TextEditingController nameController = TextEditingController();

  TextEditingController pricingController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool get areFieldsValid =>
      nameController.text.trim().isNotEmpty &&
      pricingController.text.trim().isNotEmpty &&
      descriptionController.text.trim().isNotEmpty &&
      widget.image != null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen to changes
    nameController.addListener(_updateState);
    pricingController.addListener(_updateState);
    descriptionController.addListener(_updateState);
  }

  void _updateState() => setState(() {});

  @override
  void dispose() {
    pricingController.dispose();
    descriptionController.dispose();
    nameController.dispose();
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
            buildTextField("اسم السيارة", controller: nameController),
            buildTextField("سعر السيارة",
                controller: pricingController,
                keyboardType: TextInputType.number),
            buildTextField("وصف السيارة",
                controller: descriptionController, maxLines: 3),
            SizedBox(height: AppConstants.screenHeight * 0.04),
            elevated_button(
              onPressed: areFieldsValid
                  ? () async {

                        await widget.addCar(nameController.text,
                            descriptionController.text, pricingController.text);

                        nameController.clear();
                        descriptionController.clear();
                        pricingController.clear();

                    }
                  : () {
                      print("null");
                    },
              valid: areFieldsValid,
              buttonName: "إضافة سيارة",
            ),
            SizedBox(height: AppConstants.screenHeight * 0.04),
          ],
        ));
  }
}
