import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';

import '../../../config/appColors.dart';

class NotificationScreenItem extends StatefulWidget {
  const NotificationScreenItem({super.key});

  @override
  State<NotificationScreenItem> createState() => _NotificationScreenItemState();
}

class _NotificationScreenItemState extends State<NotificationScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.screenHeight * 0.018,
          vertical: AppConstants.screenHeight * 0.014),
      child: Column(
        children: [_notificationCard()],
      ),
    );
  }

  Widget _notificationCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(
            AppConstants.screenHeight * 0.014,
          ),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications,
            size: AppConstants.screenWidth * 0.075,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: AppConstants.screenWidth * 0.03),
        // Notification Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Belal Ayman",
                    //widget.notificationModel.title.toString(),
                    style: TextStyle(
                      fontSize: AppConstants.screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(

                    "2/10/2024",
              //     widget.notificationModel.date.toString().substring(0, 16),
                    style: TextStyle(
                      fontSize: AppConstants.screenWidth * 0.038,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.screenHeight * 0.01),
              // Description
              Text(
                "This description is professional, concise, and highlights the key features of a hotel booking service. Let me know if you'd like any changes",
                style: TextStyle(
                  fontSize: AppConstants.screenWidth * 0.035,
                  color: AppColors.lightBlack,
                  // Limit to 4 lines
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 4,
              ),
              SizedBox(height: AppConstants.screenHeight * 0.02),
              // Actions
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => NotificationDetailed(
                      //           notificationModel: widget.notificationModel),
                      //     ));
                    },
                    child: Text(
                      "View Detailed",
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(width: AppConstants.screenWidth * 0.02),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
