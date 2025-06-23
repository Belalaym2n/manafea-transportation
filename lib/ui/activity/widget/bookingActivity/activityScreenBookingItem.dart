import 'package:flutter/cupertino.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';

import '../../../../config/appConstants.dart';
import '../../../../domain/models/activityModel/activityModel.dart';
import '../../../core/shared_widget/builImageBookin.dart';
import '../../../core/shared_widget/buildBookingDescription.dart';

class ActivityScreenBookingItem extends StatefulWidget {
    ActivityScreenBookingItem({super.key,
    required this.activity
    });
    ActivityModel activity;
  @override
  State<ActivityScreenBookingItem> createState() => _ActivityScreenBookingItemState();
}

class _ActivityScreenBookingItemState extends State<ActivityScreenBookingItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        buildBookingImage(
            context: context,
            imagePath: widget.activity.itemImageUrl,
            imageName: widget.activity.itemName)
        ,Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05),
          child: buildBookingDescription(
              description:      widget.activity.itemDescription ,

                BookingTittle: "About ${ widget.activity.itemName}"),
        ) ],

    );
  }
}
