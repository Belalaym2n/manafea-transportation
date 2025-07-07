import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../config/appConstants.dart';
import '../../../core/shared_widget/elevatedButton.dart';
import '../../view/activityScreenBooking.dart';

class SearchResultScreen extends StatefulWidget {
  SearchResultScreen({
    super.key,
    required this.itemName,
    required this.location,
    required this.bookingNav,
    required this.imageUrl,
  });

  String itemName;
  String imageUrl;
  String location;
  Function bookingNav;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildActivityCard();
  }

  _buildActivityCard() {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.044*AppConstants.screenWidth),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildTravelName(),
          const SizedBox(
            height: 4,
          ),
          _buildTravelLocation(),
          _buildSmallBookingButton(),
            SizedBox(
            height: AppConstants.screenHeight*0.02,
          ),
        ],
      ),
    );
  }

  _buildSmallBookingButton() {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal:0.022
          *AppConstants.screenWidth),
      child: smallElevatedButton(
          onTap: () {
            widget.bookingNav();
          },
          buttonName: LocaleKeys.buttons_name_book_now.tr()),
    );
  }

  _buildTravelLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.022*AppConstants.screenWidth),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.red, size: 0.033*AppConstants.screenWidth),
          SizedBox(width: 4), // مسافة صغيرة بين الأيقونة والنص
          Expanded(
            // يمنع تجاوز النص خارج الحدود
            child: Text(
              maxLines: 1,

              widget.location,
              style: TextStyle(fontSize: 0.0277*AppConstants.screenWidth, color: Colors.black54),
              overflow: TextOverflow.ellipsis, // يضيف "..." إذا كان النص طويلًا
            ),
          ),
        ],
      ),
    );
  }

  _buildTravelName() {
    return Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        widget.itemName,
        style: TextStyle(
            color: Colors.black,
            fontSize: 0.033*AppConstants.screenWidth,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                //blurRadius: 4,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(1, 0),
              )
            ]));
  }

  _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(0.044*AppConstants.screenWidth)),
      child: Image.network(errorBuilder: (context, error, stackTrace) {
        return Container(
          width: AppConstants.screenWidth * 0.75,
          height: AppConstants.screenHeight * 0.14,
          color: Colors.grey,
          child: const Icon(Icons.error), // لون بديل في حال الخطأ
        );
      }, widget.imageUrl,
          height: 0.141*AppConstants.screenHeight, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
