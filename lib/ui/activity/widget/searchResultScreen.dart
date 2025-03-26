import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/activity/widget/activityScreenBookingItem.dart';

import '../../carBooking/view/car_bookin_screen.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../view/activityScreenBooking.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // سيارتين في كل صف
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8, // التحكم في أبعاد الودجت
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return _buildTravelCard();
      },
    );
  }

  _buildTravelCard(){

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
            SizedBox(
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
              const ActivityScreenBooking()),
            );
          },
          buttonName: "Book Now"),
    );
  }

  _buildTravelLocation() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.red, size: 12),
          SizedBox(width: 4), // مسافة صغيرة بين الأيقونة والنص
          Expanded( // يمنع تجاوز النص خارج الحدود
            child: Text(
              "Riyadh, Kingdom of Saudi Arabia",
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
      child: Text("Madain Salih",
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
      child: Image.asset( "assets/images/v2.jpg",
          height: 110, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
