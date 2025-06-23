 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';

import '../../../data/repositories/activity/getActivitySupabseRepo.dart';
import '../../../domain/models/activityModel/activityModel.dart';
import '../connector/getActivitesConnector.dart';

class GetActivitiesScreenViewModel
    extends BaseViewModel<GetActivitiesConnector> {
  static GetActivitiesScreenViewModel? _instance;
  static GetActivitiesScreenViewModel getInstance(
      GetActivitySupabaseRepo getActivitySupabaseRepo) {
    _instance ??=
        GetActivitiesScreenViewModel._internal(getActivitySupabaseRepo);
    return _instance!;
  }
  GetActivitiesScreenViewModel._internal(this.getActivitySupabaseRepo);

  List<ActivityModel> activities = [];
  List<ActivityModel> filterActivity = [];

  bool isSearchPressed = false;
  String? _destination;
  String? _destinationLanguage;
  bool _isDataLoadedFirst = false;
  bool get isDataLoadedFirst => _isDataLoadedFirst;

  String? get destination => _destination;

  String? get destinationLanguage => _destinationLanguage;

  changeDestination(String destinationName, String destinationWithLanguage) {
    _destination = destinationName;
    _destinationLanguage = destinationName;

    filterOrdersByStatus(_destination!);
    print(_destination);
    notifyListeners();
  }

  GetActivitySupabaseRepo getActivitySupabaseRepo;



  getActivities() async {
    if(_isDataLoadedFirst){
      return;
    }
    final result = await getActivitySupabaseRepo.getActivities();
    if (result.isSuccess) {
      print("load");
      activities = result.data!;
      _isDataLoadedFirst=true;
      notifyListeners();
    } else {
      connector!.onError(result.error!);
    }
  }

  void filterOrdersByStatus(String destination) {
    filterActivity = activities
        .where((activity) => activity.destination == destination)
        .toList();
    notifyListeners();
  }

  changeSearchBool() {
    isSearchPressed = true;
    notifyListeners();
  }

  Widget showActivity() {
    if (filterActivity.isEmpty) {
      return connector!.emptyData();
    }

    return connector!.gridViewData(filterActivity);
  }
}
