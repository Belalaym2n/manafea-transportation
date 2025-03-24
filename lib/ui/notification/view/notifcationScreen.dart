import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../widgets/notificationScreenItem.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _buildNotificationText(),
          elevation: 4,
          backgroundColor: AppColors.primaryColor,
          leading: Icon(Icons.notifications_active, color: Colors.white),
        ),
        body: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => Divider(
            thickness: 1.5,
            color: Colors.grey.withOpacity(0.5),
          ),
          itemBuilder: (context, index) {
            return NotificationScreenItem();
          },
        ));
  }
 Widget _buildNotificationText(){
    return Text( "Notification",style: TextStyle(
      color: Colors.white,

      overflow: TextOverflow.ellipsis,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ],
    ),);
  }
}
