import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelScreenItem extends StatefulWidget {
  const HotelScreenItem({super.key});

  @override
  State<HotelScreenItem> createState() => _HotelScreenItemState();
}

class _HotelScreenItemState extends State<HotelScreenItem> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }



  _buildHotelImage(){}

  _buildHotelDescription(){}


}
