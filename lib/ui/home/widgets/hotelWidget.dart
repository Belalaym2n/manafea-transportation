import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/home/widgets/priceText.dart';
import 'package:manafea/ui/home/widgets/serviceName.dart';

import '../../core/shared_widget/elevatedButton.dart';
import 'imageNetwork.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        serviceName(name: 'Recommended Hotels'),
        hotelWidget(),
      ],
    );
  }

  Widget hotelWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 3),
      height: 155,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return PhysicalModel(
            color: Colors.white,
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 160,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 3),
                      imageNetwork(image: "assets/images/hotel (2).jpg"),
                      const SizedBox(height: 1.4),
                      hotelName(),
                      const SizedBox(height: 3),
                      hotelLocation(),
                      priceText(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget hotelLocation() {
  return Row(
    children: [
      Icon(Icons.location_on, color: Colors.red, size: 14),
      SizedBox(width: 5),
      Text(
        "New York, U.S.",
        style: TextStyle(color: Colors.black54, fontSize: AppConstants.screenWidth * 0.03),
      ),
    ],
  );
}

Widget hotelName() {
  return Row(
    textDirection: TextDirection.ltr,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        textAlign: TextAlign.left,
        "Luxury Hotel",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(1, 0),
            ),
          ],
        ),
      ),
    ],
  );
}
