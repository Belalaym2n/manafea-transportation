import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/notification/widgets/notificationDetailedItem.dart';

import '../../../config/appColors.dart';
import '../../../domain/models/notificationModel/notificationModel.dart';

class NotificationScreenItem extends StatefulWidget {
   NotificationScreenItem({super.key ,
     required this.notificationModel,
  });

  NotificationModel notificationModel;

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
        _buildNotificationIcon(),
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
                  Flexible(
                    flex: 2, // اجعل العنوان يأخذ حصة أكبر
                    child: _buildNotificationTitle(),
                  ),
                  Flexible(
                    flex: 2, // اجعل الوقت يأخذ مساحة أقل
                    child: _buildNotificationTimeText(),
                  ), ],
              ),
              SizedBox(height: AppConstants.screenHeight * 0.01),
              // Description
              _buildNotificationDescription(),
              SizedBox(height: AppConstants.screenHeight * 0.02),
              _buildViewDetailedButton()
              // Actions

            ],
          ),
        ),
      ],
    );
  }
  Widget _buildNotificationIcon(){
    return  Container(
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
    );
  }


  Text _buildNotificationTitle(){
    return  Text(
     widget.notificationModel.title??'belal',
      //widget.notificationModel.title.toString(),
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.045,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
        overflow: TextOverflow.ellipsis

      ),
    );
  }

  Text _buildNotificationTimeText(){
    return Text(

      widget.notificationModel.date.toString().substring(0, 16),
      //     widget.notificationModel.date.toString().substring(0, 16),
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.038,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
    );
  }

  Text _buildNotificationDescription(){
    return Text(
      widget.notificationModel.description,
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.035,
        color: AppColors.lightBlack,
        // Limit to 4 lines
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 4,
    );
  }

  Widget _buildViewDetailedButton(){
    return   Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetailedItem(
                      notificationModel: widget.notificationModel),
                ));
          },
          child: Text(
            LocaleKeys.notification_screen_view_detailed.tr(),
            style: TextStyle(
              fontSize: AppConstants.screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(width: AppConstants.screenWidth * 0.02),
      ],
    );
  }
}
