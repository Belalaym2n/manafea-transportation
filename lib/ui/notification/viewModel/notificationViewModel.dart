import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';

import '../../../data/repositories/notifcationRepo/notificationRepo.dart';
import '../../../domain/models/notificationModel/notificationModel.dart';
import '../connector/notificationConnector.dart';

class NotificationViewModel extends BaseViewModel<NotificationConnector> {
  static NotificationViewModel? _instance;

  static NotificationViewModel getInstance(NotificationRepository _repository) {
    _instance ??= NotificationViewModel._internal(_repository);
    return _instance!;
  }

  NotificationViewModel._internal(this._repository);
  bool _isDataLoadedFirst = false;

  bool get isDataLoadedFirst => _isDataLoadedFirst;

  final NotificationRepository _repository;


  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  List<NotificationModel> get notifications => _notifications;

  bool get isLoading => _isLoading;

  Future<void> fetchNotifications() async {
    if(_isDataLoadedFirst){
      return;
    }
    setLoading(true);
    try {
      _notifications = await _repository.fetchNotifications();
      _isDataLoadedFirst=true;
      notifyListeners();
    } catch (error) {
      print("error $error");
      setLoading(false);
      connector?.onError(error.toString());
    } finally {
      setLoading(false);
    }
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading; // عدّلنا السطر ده
    notifyListeners(); // نخبر الواجهة بضرورة التحديث
  }

  Widget showData() {
    if (_isLoading) {
      return connector!.showLoading();
    } else if (_notifications.isEmpty) {
      return connector!.emptyData();
    } else {
      return connector!.showNotification(_notifications);
    }
  }
}
