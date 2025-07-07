import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/carBooking/view/car_bookin_screen.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

class CarScreenItem extends StatefulWidget {
  CarScreenItem({super.key, this.carModel});

  CarModel? carModel;

  @override
  State<CarScreenItem> createState() => _CarBookingScreenItemState();
}

class _CarBookingScreenItemState extends State<CarScreenItem> {
  double aspectRatio = (1.73 * (AppConstants.screenWidth * 0.1)) /
      AppConstants.screenHeight *
      0.1;

  @override
  Widget build(BuildContext context) {
    return _buildCarCard();
  }

  _buildCarCard() {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.039),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildCarName(),
          _buildCarPricing(),
          _buildBookButton(),
          SizedBox(
            height: AppConstants.screenHeight*0.02,
          ),
        ],
      ),
    );
  }

  Widget _buildBookButton() {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal:0.022
    *AppConstants.screenWidth),

      child: smallElevatedButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CarBookingScreen(
                        carModel: widget.carModel!,
                      )),
            );
          },
          buttonName: LocaleKeys.buttons_name_book_now.tr()),
    );
  }

  Widget _buildCarPricing() {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.02),
        child: Text(
          widget.carModel?.itemPricing.toString() ?? '123',
          style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.038,
              color: Colors.black54),
        ));
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: widget.carModel?.itemImageUrl != null &&
              widget.carModel!.itemImageUrl.isNotEmpty
          ? Image.network(
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: AppConstants.screenHeight * 0.14,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Icon(
              Icons.broken_image,
              color: Colors.grey.shade700,
              size: 0.11*AppConstants.screenWidth,
            ),
          );
        },
              widget.carModel!.itemImageUrl,
              height: AppConstants.screenHeight * 0.14,
              fit: BoxFit.cover,
              width: double.infinity,
            )
          : Container(
              height: AppConstants.screenHeight * 0.14,
              width: double.infinity,
              color: Colors.grey[300], // لون خلفية خفيف
              child:   Icon(
                Icons.image_not_supported,
                size: 0.138*AppConstants.screenWidth,
                color: Colors.grey,
              ),
            ),
    );
  }

  Widget _buildCarName() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.02),
      child: Text(widget.carModel?.itemName ?? 'BM',
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontSize: AppConstants.screenWidth * 0.038,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(1, 0),
                )
              ])),
    );
  }
}
