import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../activity/widget/getActivitiesScreen/showDiestination.dart';
import '../../core/commonScreen/chooseLocationPicker.dart';
import '../../core/shared_widget/addImageWidget.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../../core/shared_widget/textFormFieldForAdmin.dart';

class AddHotelItem extends StatefulWidget {
  AddHotelItem(
      {super.key,
      required this.publicUrl,
      required this.addHotel,
      required this.openImage,
      required this.image    ,
        required this.selectedLocation,
        required this.changeLocation,
      });

  String? selectedLocation;
  Function(String) changeLocation;
  final Future<dynamic> Function() openImage;
  File? image;
  String publicUrl;
  Future Function(AddHotelModel) addHotel;

  @override
  State<AddHotelItem> createState() => _AddHotelItemState();
}

class _AddHotelItemState extends State<AddHotelItem> {
  TextEditingController hotelName = TextEditingController();

  TextEditingController hotelAddress = TextEditingController();

  TextEditingController hotelCommonRoomPricing = TextEditingController();
   TextEditingController hotelSpecialRoomPricing = TextEditingController();

  TextEditingController hotelDescription = TextEditingController();
  final List<String> locations = [
    "ff",
    "Riyadh - Nakheel",
    "Riyadh - Malaz",
    "Riyadh - Suwaidi"
  ];
  bool get areFieldsValid =>
      hotelName.text.trim().isNotEmpty &&
      hotelAddress.text.trim().isNotEmpty &&
       hotelCommonRoomPricing.text.trim().isNotEmpty &&
      hotelSpecialRoomPricing.text.trim().isNotEmpty &&
      widget.image != null &&
      widget.selectedLocation != null &&
      hotelDescription.text.trim().isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     hotelAddress.addListener(_updateState);
    hotelName.addListener(_updateState);
     hotelCommonRoomPricing.addListener(_updateState);
    hotelSpecialRoomPricing.addListener(_updateState);
    hotelDescription.addListener(_updateState);
  }

  void _updateState() => setState(() {});

  @override
  void dispose() {
    hotelAddress.dispose();
    hotelName.dispose();
     hotelSpecialRoomPricing.dispose();
    hotelDescription.dispose();
    hotelCommonRoomPricing.dispose();
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
            buildTextField("Name", controller: hotelName),
            buildTextField('Address', controller: hotelAddress),
            buildTextField("Hotel Common Room Pricing",
                keyboardType: TextInputType.number,
                controller: hotelCommonRoomPricing),
            buildTextField(
              "Hotel Special Room Pricing",
              keyboardType: TextInputType.number,
              controller: hotelSpecialRoomPricing,
            ),
            buildTextField("Description",
                controller: hotelDescription, maxLines: 3),
            chooseCountry(),
            SizedBox(height: AppConstants.screenHeight * 0.04),
            elevated_button(
              onPressed: areFieldsValid
                  ? () async {
                try{
                      final hotel = AddHotelBuilder()
                           .setItemDescription(hotelDescription.text)
                          .setCommonRoomPricing(int.parse(hotelCommonRoomPricing.text))
                          .setItemName(hotelName.text)
                          .setItemImageUrl(widget.publicUrl)
                          .setSpecialRoomPricing(int.parse(
                          hotelSpecialRoomPricing.text))
                          .setItemAddress(hotelAddress.text)

                          .setCountry(widget.selectedLocation.toString())
                          .build();

                      await widget.addHotel(hotel);
                      hotelDescription.clear();
                      hotelName.clear();
                      hotelSpecialRoomPricing.clear();
                      hotelAddress.clear();
                      hotelCommonRoomPricing.clear();

                    }catch(E){

                }
                }
                  : () {
                      print("null");
                    },
              valid: areFieldsValid,
              buttonName: "Save Activity",
            ),
            SizedBox(height: AppConstants.screenHeight * 0.04),
          ],
        ));
  }

  chooseCountry(){
  return  InkWell(
      onTap: () => showLocationsPicker(
      context: context,
      changeLocation: widget.changeLocation,
      location: widget.selectedLocation,
      locations: locations),child:Container(
    padding: EdgeInsets.symmetric(
        vertical: AppConstants.screenHeight * 0.015,
        // 1.5% من الارتفاع
        horizontal: AppConstants.screenWidth * 0.04),
    // 4% من العرض
    decoration: BoxDecoration(
      border: Border.all(
          color: AppColors.primaryColor, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.selectedLocation ?? "Select a country",
          style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.04,
              // 4% من العرض
              color: Colors.black54),
        ),
        const Icon(Icons.arrow_drop_down_circle)
      ],
    ),
  ));
  }
}
