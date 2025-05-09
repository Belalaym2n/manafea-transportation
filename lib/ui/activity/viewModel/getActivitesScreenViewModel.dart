import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';

import '../../../data/repositories/activity/getActivitySupabseRepo.dart';
import '../../../domain/models/activityModel/activityModel.dart';
import '../connector/getActivitesConnector.dart';
import '../view/activityScreenBooking.dart';
import '../widget/getActivitiesScreen/searchResultScreen.dart';

class GetActivitiesScreenViewModel
    extends BaseViewModel<GetActivitiesConnector> {
  List<ActivityModel> activities = [];
  List<ActivityModel> filterActivity = [];


  bool isSearchPressed = false;
  String? _destination;
  String? _destinationLanguage;
  String? get destination => _destination;
  String? get destinationLanguage => _destinationLanguage;

  changeDestination(String destinationName,String destinationWithLanguage) {
    _destination = destinationName;
    _destinationLanguage = destinationName;

    filterOrdersByStatus(_destination!);
     print(_destination);
    notifyListeners();
  }

  GetActivitySupabaseRepo getActivitySupabaseRepo;

  GetActivitiesScreenViewModel(this.getActivitySupabaseRepo);

  getActivities() async {
    final result = await getActivitySupabaseRepo.getActivities();
    if (result.isSuccess) {
      activities = result.data!;
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

  changeSearchBool( ) {
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
