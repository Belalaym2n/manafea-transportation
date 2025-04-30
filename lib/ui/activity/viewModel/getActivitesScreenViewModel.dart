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
  String? _destination;

  bool isSearchPressed = false;

  String? get destination => _destination;

  changeDestination(String destinationName) {
    _destination = destinationName;
    filterOrdersByStatus(_destination!);
     print(_destination);
    notifyListeners();
  }

  GetActivitySupabaseRepo getActivitySupabaseRepo;

  GetActivitiesScreenViewModel(this.getActivitySupabaseRepo);

  getActivities() async {
    try {
      activities = await getActivitySupabaseRepo.getActivities();

    } catch (e) {
      print("Error ${e.toString()}");
      connector!.onError(e.toString());
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
      return const Expanded(
        child: Center(child: Text("No Orders Found")),
      );
    }

    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // سيارتين في كل صف
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8, // التحكم في أبعاد الودجت
            ),
            itemCount: filterActivity.length,
            itemBuilder: (context, index) {
              var activity = filterActivity[index];

              return SearchResultScreen(
                bookingNav: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                      ActivityScreenBooking(
                        activityModel: activity,
                      )),
                  );
                },
                imageUrl: activity.itemImageUrl,
                itemName: activity.itemName,
                location: activity.itemAddress,
               );
            }));
  }
}
