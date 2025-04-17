import 'package:manafea/config/base_class.dart';

import '../../../data/repositories/notifcationRepo/notificationRepo.dart';
import '../../../domain/models/notificationModel.dart';
import '../connector/notificationConnector.dart';

class NotificationViewModel extends BaseViewModel<NotificationConnector>{
 final NotificationRepository _repository;

 NotificationViewModel(this._repository);

  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  List<NotificationModel> get notifications => _notifications;

  bool get isLoading => _isLoading;

  Future<void> fetchNotifications() async {
     setLoading (true);
    try {
      _notifications = await _repository.fetchNotifications();
    } catch (error) {
      print("error $error");
      setLoading (false);
      connector?.onError(error.toString());
    } finally {
      setLoading (false);
    }
  }

 setLoading(bool isLoading) {
   _isLoading = isLoading; // عدّلنا السطر ده
   notifyListeners(); // نخبر الواجهة بضرورة التحديث
 }



}