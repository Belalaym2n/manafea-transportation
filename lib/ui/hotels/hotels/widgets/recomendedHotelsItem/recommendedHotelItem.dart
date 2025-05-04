import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../core/shared_widget/elevatedButton.dart';
import '../../../hotelBooking/view/hotelBookinScreen.dart';

class RecommendedHotelItem extends StatefulWidget {
    RecommendedHotelItem({super.key,required this.hotels});
  List<AddHotelModel> hotels ;

  @override
  State<RecommendedHotelItem> createState() => _RecommendedHotelItemState();
}

class _RecommendedHotelItemState extends State<RecommendedHotelItem> {
  @override
  Widget build(BuildContext context) {

    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      child: _buildHotelList(),
    );
  }

  Widget _buildHotelList() {
    return SizedBox(
      height: AppConstants.screenHeight * 0.296, // 30% من الارتفاع
      child: ListView.separated(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.04),
         scrollDirection: Axis.horizontal,
        itemCount: widget.hotels.length,
        separatorBuilder: (_, __) =>
            SizedBox(width: AppConstants.screenWidth * 0.04),
         itemBuilder: (context, index) {
          return PhysicalModel(
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              child: _buildHotelCard(widget.hotels[index]));
        },
      ),
    );
  }

  Widget _buildHotelCard(AddHotelModel hotel) {
    return PhysicalModel(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: AppConstants.screenWidth * 0.7, // 70% من العرض
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageNetwork(image: hotel.itemImageUrl),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth * 0.03,
                      vertical: 4), // 3% من العرض
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hotelName(hotel.itemName),
                      SizedBox(height: AppConstants.screenHeight * 0.01),
                      // 1% من الارتفاع
                      hotelLocation(hotel.itemAddress),
                    ],
                  ),
                ),
                SizedBox(height: AppConstants.screenHeight * 0.01),
                // 2% من الارتفاع

                // 1% من الارتفاع
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              AppConstants.screenWidth * 0.02), // 3% من العرض
                      child: smallElevatedButton(
                          buttonName: LocaleKeys.buttons_name_book_now.tr(),
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:
                               (context) => HotelBookingScreen(
                                 hotelModel:hotel ,
                               )

                             ,));
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

Widget imageNetwork({required String image}) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    ),
    child: Image.network(
      image,
      width: AppConstants.screenWidth * 0.75,
      height: AppConstants.screenHeight * 0.14,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: AppConstants.screenWidth * 0.75,
          height: AppConstants.screenHeight * 0.14,
          color: Colors.grey, // لون بديل في حال الخطأ
         );
      },
    ),
  );
}


Widget hotelLocation(String hotelLocation) {
  return Row(
    children: [
      const Icon(Icons.location_on, color: Colors.red, size: 14),
      SizedBox(width: AppConstants.screenWidth * 0.02), // 2% من العرض
      Expanded(
        child: Text(
          maxLines: 1,
          hotelLocation,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,

            color: AppColors.primaryColor,
            fontSize:
                AppConstants.screenWidth * 0.03, // حجم الخط بناءً على العرض
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget hotelName(String hotelName) {
  return Text(
    hotelName,
    maxLines: 1,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: AppColors.primaryColor,
      fontSize: AppConstants.screenWidth * 0.04, // حجم الخط بناءً على العرض
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(1, 1),
        ),
      ],
    ),
  );
}
