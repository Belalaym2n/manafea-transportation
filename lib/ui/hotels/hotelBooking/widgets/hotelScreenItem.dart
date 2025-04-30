import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/ui/core/shared_widget/builImageBookin.dart';
import 'package:manafea/ui/core/shared_widget/buildBookingDescription.dart';

class HotelScreenItem extends StatefulWidget {
    HotelScreenItem({super.key,required this.hotelModel});
AddHotelModel hotelModel;
  @override
  State<HotelScreenItem> createState() => _HotelScreenItemState();
}

class _HotelScreenItemState extends State<HotelScreenItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBookingImage(imagePath:
            widget.hotelModel.itemImageUrl
                , imageName: widget.hotelModel.itemName
            ),
            SizedBox(height: AppConstants.screenHeight * 0.012),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05),
              child: buildBookingDescription(

                description:  widget.hotelModel.itemDescription
                ,

                  BookingTittle: "About the hotel"),
            ),
          ],

    );
  }


  /// 🔹 تحسين تصميم أيقونة الرجوع لتبدو أنيقة

  /// 🔹 تحسين العنوان والوصف بتصميم احترافي

}
