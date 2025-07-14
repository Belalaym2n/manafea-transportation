import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
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
            buildBookingImage(
                context: context,
                imagePath:
            widget.hotelModel.itemImageUrl
                , imageName: widget.hotelModel.itemName
            ),
            SizedBox(height: AppConstants.screenHeight * 0.012),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:
              AppConstants.screenWidth * 0.05),
              child: buildBookingDescription(
                googleMapsUrl: widget.hotelModel.googleMapsUrl,
                location: widget.hotelModel.itemAddress,

                description:  widget.hotelModel.itemDescription
                ,
                  BookingTittle:
                  LocaleKeys.hotelsScreen_about_the_hotel.tr()),
            ),
          ],

    );
  }


  /// 🔹 تحسين تصميم أيقونة الرجوع لتبدو أنيقة

  /// 🔹 تحسين العنوان والوصف بتصميم احترافي

}
