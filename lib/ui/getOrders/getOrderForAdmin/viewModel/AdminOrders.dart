import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/getOrdersForAdmin/getOrdersForAdminService.dart';

import '../../../../data/repositories/getOrderForAdmin/getOrdersForAdminRepo.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../connector/adminOrderConnector.dart';

class AdminOrderViewModel extends BaseViewModel<AdminOrderConnector> {
  List<BaseOrder> allOrders = [];

  final AdminOrdersHistoryFirebaseRepo getOrdersForAdminRepo;
  DateTime _selectedDay = DateTime.now();
  String _selectStatus = "Pending";

  bool _isLoading = false;
  bool _updateStatusLoading = false;
  String? errorMessage;

  DateTime get selectedDay => _selectedDay;

  String get selectStatus => _selectStatus;

  bool get isLoading => _isLoading;

  bool get updateStatusLoading => _updateStatusLoading;

  AdminOrderViewModel(this.getOrdersForAdminRepo);

  StreamSubscription? _ordersSubscription;

  void listenToOrders() {
    _isLoading = true;
    notifyListeners();

    _ordersSubscription?.cancel();
    final String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDay);

    print(formattedDate);
    _ordersSubscription = getOrdersForAdminRepo
        .getAllOrdersStream(date: formattedDate)
        .listen((result) {
      if (result.isSuccess) {
        allOrders = result.data!;
      } else {
        errorMessage = result.error;
        connector?.onError(errorMessage!);
      }

      _isLoading = false;
      notifyListeners();
    });
  }

  void updateStatus({required String id, required String status}) async {
    _updateStatusLoading = true;
    notifyListeners();

    final result = await getOrdersForAdminRepo.updateOrderStatus(
      id: id,
      status: status,
    );

    _updateStatusLoading = false;
    notifyListeners();

    if (result.isSuccess) {
      connector?.onMessage("Status updated successfully ✅");
    } else {
      connector?.onError(result.error ?? "Something went wrong ❌");
    }
  }

  changeDate(DateTime date) {
    _selectedDay = date;
    print(_selectedDay);
    notifyListeners();
    listenToOrders();
  }

  Widget showOrder() {
    if (allOrders.isEmpty) {
      return connector!.emptyOrders();
    }

    return connector!.showOrders(allOrders);
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
