import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/userOrdersHistoryRepo/userOrdersHistoryRepo.dart';
import 'package:manafea/data/services/userHistoryOrderDatabaseService/userOrdersHistoryServic.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:manafea/ui/userOrders/connector/getUserOrderConnector.dart';

import '../viewModel/getOrdersViewModel.dart';
import '../widgets/tabController.dart';
import '../widgets/userOrdersScreenItem.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends BaseView<GetUserOrdersViewModel
,UserOrders>  implements GetUserOrderConnector{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            buildScreenName(),
            TabControllerItem(),
            viewModel.showOrder(),
          ],
        )
      ),
    ) ;
  }

  @override
  GetUserOrdersViewModel init_my_view_model() {
    UserOrderHistoryService _userOrderHistoryService=UserOrderHistoryService();

    UserOrderHistoryRepo userOrderHistoryRepo
    =UserOrderHistoryRepo(_userOrderHistoryService);
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
    // TODO: implement showLoading
    return LoadingWidget(

    );
  }
}
