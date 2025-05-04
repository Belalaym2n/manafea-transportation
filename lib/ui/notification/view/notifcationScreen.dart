import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/notifcationRepo/notificationRepo.dart';
import 'package:manafea/data/services/notifcationService/notificationService.dart';
import 'package:manafea/domain/models/notificationModel/notificationModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/notification/connector/notificationConnector.dart';
import 'package:manafea/ui/notification/viewModel/notificationViewModel.dart';
import 'package:provider/provider.dart';
 import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/appColors.dart';
import '../widgets/notificationScreenItem.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState
    extends BaseView<NotificationViewModel, NotificationScreen>
    implements NotificationConnector {
  @override
  void initState() {
    print("object");
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
    viewModel.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        builder: (context, child) => Consumer<NotificationViewModel>(
            builder: (context, viewModel, child) => Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: _buildNotificationText(),
                  elevation: 4,
                  backgroundColor: AppColors.primaryColor,
                  leading:
                      Icon(Icons.notifications_active, color: Colors.white),
                ),
                body: viewModel.isLoading
                    ?  showLoading()
                    : ListView.separated(
                        itemCount: viewModel.notifications.length,
                        separatorBuilder: (context, index) => Divider(
                          thickness: 1.5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        itemBuilder: (context, index) {
                          final notification = viewModel.notifications[index];
                          return NotificationScreenItem(
                            notificationModel: notification,
                          );
                        },
                      ))));
  }

  Widget _buildNotificationText() {
    return Text(
      LocaleKeys.screensName_notification.tr(),
      style: TextStyle(
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  @override
  NotificationViewModel init_my_view_model() {
    GetNotificationService _service = GetNotificationService();
    NotificationRepository notificationRepository =
        NotificationRepository(_service);
    // TODO: implement init_my_view_model
    return NotificationViewModel(notificationRepository);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
 Widget showLoading() {
    print("showLoading() is called");
    NotificationModel notificationViewModel = NotificationModel(
        id: "id",
        time: "time",
        date: "someString.substring(0, min(16sff",
        title: "title",
        description:
            "description description description description description description  Vdescription description V");
    // TODO: implement showLoading
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
              thickness: 1.5,
              color: Colors.grey.withOpacity(0.5),
            ),
        itemBuilder: (context, index) {
          return   Skeletonizer(
              child: NotificationScreenItem(
                  notificationModel: notificationViewModel));

        });
  }
}
