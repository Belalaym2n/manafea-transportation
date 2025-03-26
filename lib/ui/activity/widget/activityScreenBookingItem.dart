import 'package:flutter/cupertino.dart';

import '../../../config/appConstants.dart';
import '../../core/shared_widget/builImageBookin.dart';
import '../../core/shared_widget/buildBookingDescription.dart';

class ActivityScreenBookingItem extends StatefulWidget {
  const ActivityScreenBookingItem({super.key});

  @override
  State<ActivityScreenBookingItem> createState() => _ActivityScreenBookingItemState();
}

class _ActivityScreenBookingItemState extends State<ActivityScreenBookingItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        buildBookingImage(imagePath: "assets/images/v2.jpg",
            imageName: "Madain Salih")
        ,Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05),
          child: buildBookingDescription(BookingTittle: "About Madain Salih "),
        ) ],

    );
  }
}
