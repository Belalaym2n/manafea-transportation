import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';

import '../../../core/shared_widget/elevatedButton.dart';
import '../../view/activityScreenBooking.dart';

class SearchResultScreen extends StatefulWidget {
    SearchResultScreen({super.key,required this.activityModel});
ActivityModel activityModel;
  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {

        return _buildActivityCard();

  }

  _buildActivityCard(){

      return Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            _buildSmallBookingButton()     ,
          ],
        ),
      );

  }

  _buildSmallBookingButton(){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: smallElevatedButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                ActivityScreenBooking(
                  activityModel: widget.activityModel,
                )),
            );
          },
          buttonName: "Book Now"),
    );
  }

  _buildTravelLocation() {
    return     Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.red, size: 12),
          SizedBox(width: 4), // مسافة صغيرة بين الأيقونة والنص
          Expanded( // يمنع تجاوز النص خارج الحدود
            child: Text(
              widget.activityModel.itemAddress  ,
              style: TextStyle(fontSize: 10, color: Colors.black54),
              overflow: TextOverflow.ellipsis, // يضيف "..." إذا كان النص طويلًا
            ),
          ),
        ],
      ),
    );
  }

  _buildTravelName(){
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(widget.activityModel.itemName,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  //blurRadius: 4,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(1, 0),
                )
              ])),
    );
  }
  _buildImage(){
    return        ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network( widget.activityModel.itemImageUrl,
          height: 110, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
