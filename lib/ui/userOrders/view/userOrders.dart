import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/userOrdersHistoryRepo/userOrdersHistoryRepo.dart';
import 'package:manafea/data/services/userHistoryOrderDatabaseService/userOrdersHistoryServic.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:manafea/ui/userOrders/connector/getUserOrderConnector.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../viewModel/getOrdersViewModel.dart';
import '../widgets/orderItem.dart';
import '../widgets/tabController.dart';
import '../widgets/userOrdersScreenItem.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends BaseView<GetUserOrdersViewModel, UserOrders>
    implements GetUserOrderConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
    viewModel.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<GetUserOrdersViewModel>(
          builder: (context, view, child) {
            return AbsorbPointer(
                absorbing: view.deleteOrderLoading,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        buildScreenName(),
                        TabControllerItem(
                          selectStatus: (status) {
                            view.changeStatus(status);
                           },
                        ),
                        view.isLoading == true
                            ? showLoading()
                            : view.showOrder(),
                      ],
                    ),
                    if (view.deleteOrderLoading == true)
                      Center(
                        child: deleteOrderLoading(), // يظهر الـ loading هنا
                      ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  @override
  GetUserOrdersViewModel init_my_view_model() {
    UserOrderHistoryFirebaseService _userOrderHistoryService =
        UserOrderHistoryFirebaseService();

    UserOrderHistoryFirebaseRepo userOrderHistoryRepo =
        UserOrderHistoryFirebaseRepo(_userOrderHistoryService);
    // TODO: implement init_my_view_model
    return GetUserOrdersViewModel(userOrderHistoryRepo);
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
            return OrderItem(
                cancelOrder: (String id) {},
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
  deleteOrderLoading() {
    // TODO: implement deleteOrderLoading
    return LoadingWidget();
  }
}
