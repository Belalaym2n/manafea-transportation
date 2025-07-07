import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/appColors.dart';
import '../../../../config/appConstants.dart';
import '../../../../data/repositories/getOrderForAdmin/getOrdersForAdminRepo.dart';
import '../../../../data/services/getOrdersForAdmin/getOrdersForAdminService.dart';
import '../../../../domain/models/baseOrderModel/baseOrderWidget.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../getOrdersForUser/widgets/orderItem/orderItem.dart';
import '../connector/adminOrderConnector.dart';
import '../viewModel/AdminOrders.dart';
import '../widgets/calenderWidget.dart';
import '../widgets/getOrdersItem.dart';

class GetOrdersScreen extends StatefulWidget {
  const GetOrdersScreen({super.key});

  @override
  State<GetOrdersScreen> createState() => _GetOrdersScreenState();
}

class _GetOrdersScreenState
    extends BaseView<AdminOrderViewModel, GetOrdersScreen>
    implements AdminOrderConnector {
  @override
  void initState() {


    super.initState();
    print("h ${AppConstants.screenHeight}");
    print("h ${AppConstants.screenWidth}");
    viewModel.connector = this;

    viewModel.listenToOrders();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenWidth * 0.04,
                    vertical: AppConstants.screenHeight * 0.015),
                child: ChangeNotifierProvider.value(
                    value: viewModel,
                    builder: (context, child) => Consumer<AdminOrderViewModel>(
                          builder: (context, value, child) => AbsorbPointer(
                            absorbing: value.updateStatusLoading,
                            child: Stack(
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      LocaleKeys.hotelsScreen_select_Date.tr(),
                                        style: TextStyle(
                                          fontSize:
                                              AppConstants.screenWidth * 0.042,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: AppConstants.screenHeight *
                                              0.017),
                                      CalendarWidget(
                                          selectedDate: value.selectedDay,
                                          onDateChanged: value.changeDate),
                                      value.isLoading == true
                                          ? showLoading()
                                          : value.showOrder(),
                                    ]),
                                if (value.updateStatusLoading) LoadingWidget()
                              ],
                            ),
                          ),
                        )))));
  }

  @override
  Widget emptyOrders() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inbox,
            size: AppConstants.screenWidth*0.2,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            "No Orders Available",
            style: TextStyle(
              fontSize: 0.05*AppConstants.screenWidth,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "You're all caught up for today!",
            style: TextStyle(
              fontSize: 0.022*AppConstants.screenWidth,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  AdminOrderViewModel init_my_view_model() {
    GetOrdersForAdminService getOrdersForAdminService =
        GetOrdersForAdminService();
    AdminOrdersHistoryFirebaseRepo getOrdersForAdminRepo =
        AdminOrdersHistoryFirebaseRepo(getOrdersForAdminService);
    // TODO: implement init_my_view_model
    return AdminOrderViewModel(getOrdersForAdminRepo);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    return Expanded(
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GetAdminOrdersItem(
                updateStatus: (String id, String status) {},
                orderName: 'bella',
                orderType: "fbas;fkd",
                orderDetailedChanged: Container(),
                order: BaseOrder(
                    service: 'sdfsd',
                    phoneNumber: "01224343",
                    name: "BELAL Ayman",
                    id: "5973ijdsljljsljdjf",
                    price: 2424,
                    time: "2o4uo2",
                    orderDate: "dsfj",
                    userId: "dsf",
                    status: "sdfsd"));
          },
        ),
      ),
    );
  }

  @override
  showOrders(List<BaseOrder> order) {
    return Expanded(
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) {
          var orderData = order[index];
          final strategy = OrderWidgetAdminStrategy.getStrategy(orderData);

          if (strategy != null) {
            return strategy.buildWidget(orderData,
                (String orderId, String status) {
              viewModel.updateStatus(id: orderData.id, status: status);
            });
          }

          return const SizedBox();
        },
      ),
    );
  }
}
