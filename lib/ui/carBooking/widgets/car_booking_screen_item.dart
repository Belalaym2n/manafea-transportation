import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/ui/core/shared_widget/builImageBookin.dart';

import '../../../config/appConstants.dart';
import '../../core/shared_widget/buildBookingDescription.dart';

class CarBookingScreenItem extends StatefulWidget {
  CarBookingScreenItem({super.key, required this.carModel});

  AddCarModel carModel;

  @override
  State<CarBookingScreenItem> createState() => _CarBookingScreenItemState();
}

class _CarBookingScreenItemState extends State<CarBookingScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBookingImage(
            imagePath: widget.carModel.itemImageUrl,
            imageName: widget.carModel.itemName),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05),
          child: buildBookingDescription(BookingTittle: "About the Car",
          description: widget.carModel.itemDescription),
        )
      ],
    );
  }
}
