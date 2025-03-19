import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/home/widgets/imageNetwork.dart';
import 'package:manafea/ui/home/widgets/priceText.dart';
import 'package:manafea/ui/home/widgets/serviceName.dart';

import '../../../config/appConstants.dart';
import '../../core/shared_widget/elevatedButton.dart';

class TravelWidget extends StatefulWidget {
  const TravelWidget({super.key});

  @override
  State<TravelWidget> createState() => _TravelWidgetState();
}

class _TravelWidgetState extends State<TravelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        serviceName(name: 'Travels'),
        SizedBox(
          height: 30,
        ),
        PhysicalModel(
          color: Colors.white,
          // لون الخلفية
          elevation: 10,
          // ارتفاع الظل
          shadowColor: Colors.black.withOpacity(0.3),
          // لون الظل وشفافيته
          borderRadius: BorderRadius.circular(12),
          // تدوير الحواف
          child:_buildHotelList(),)
      ],
    );
  }

  Widget _buildHotelList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return PhysicalModel(
              color: Colors.white,
              // لون الخلفية
              elevation: 10,
              // ارتفاع الظل
              shadowColor: Colors.black.withOpacity(0.3),
              // لون الظل وشفافيته
              borderRadius: BorderRadius.circular(12),
              // تدوير الحواف
              child:_buildHotelCard());
        },
      ),
    );
  }
  //
  Widget _buildHotelCard() {
    return PhysicalModel(
        color: Colors.white,
        // لون الخلفية
        elevation: 10,
        // ارتفاع الظل
        shadowColor: Colors.black.withOpacity(0.3),
        // لون الظل وشفافيته
        borderRadius: BorderRadius.circular(12),
        // تدوير الحواف
        child:Container(
          width: 280,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageNetwork(image: "assets/images/v2.jpg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hotelName(),
                    const SizedBox(height: 4),
                    hotelLocation(),
                  ],
                ),
              ),
            ],
          ),
        ) );
  }




}


Widget hotelLocation(){
  return   Row(

    children: [
      Icon(Icons.location_on,color: Colors.black54,size: 14,),
      Text("New York, U.S.",style: TextStyle(
          color: Colors.black54,
          fontSize: AppConstants.screenWidth*0.03
      ),)
    ],
  );
}

Widget hotelName(){
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
                  //blurRadius: 4,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(1, 0),
                )])),
    ],
  );
}


