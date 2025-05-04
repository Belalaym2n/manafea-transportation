import 'package:easy_localization/easy_localization.dart';
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

import '../../../config/appConstants.dart';
import '../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../domain/models/baseOrderModel/baseOrderWidget.dart';
import '../../../generated/locale_keys.g.dart';
import '../viewModel/getOrdersViewModel.dart';
import '../widgets/orderItem/orderItem.dart';
import '../widgets/tab/tabController.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends BaseView<GetUserOrdersViewModel, UserOrders>
    with SingleTickerProviderStateMixin
    implements GetUserOrderConnector {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    viewModel.connector = this;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // من تحت
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    viewModel.getOrders().then((_) {
      _controller.forward();
    });
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
                            : view.showOrder(_slideAnimation),
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
  Widget buildScreenName() {
    return Text(
      LocaleKeys.screensName_orders.tr(),

      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: AppConstants.screenWidth * 0.055,
        letterSpacing: 1.2,
        color: Colors.black87,
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
                orderName: 'bella',
                orderType: "fbas;fkd",
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
    return const LoadingWidget();
  }

  @override
  emptyOrders() {
    // TODO: implement emptyOrders
    return const Text("NO ORDERS");
  }

  @override
  showOrders(List<BaseOrder> order) {
    // TODO: implement showOrders
  return  ListView.builder(
      itemCount: order.length,
      itemBuilder: (context, index) {
        var orderData = order[index];
        final strategy = OrderWidgetStrategy.getStrategy(orderData);

        if (strategy != null) {
          return strategy.buildWidget(orderData,

                  (String orderId) {
                // هنا يتم استدعاء الدالة بشكل غير متزامن داخل الـ callback
                viewModel.deleteOrder(orderId);
              });
        }
        print("sdf");

        return const SizedBox();
      },
    );
  }


}
