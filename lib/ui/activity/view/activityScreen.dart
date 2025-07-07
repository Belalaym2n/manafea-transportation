import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/activity/getActivitySupabseRepo.dart';
import 'package:manafea/data/services/activity/getActivity.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/activity/connector/getActivitesConnector.dart';
import 'package:manafea/ui/activity/viewModel/getActivitesScreenViewModel.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../config/appConstants.dart';
import '../../core/commonScreen/buildHeaderForChooseSpecificaLocation.dart';
import '../widget/getActivitiesScreen/searchResultScreen.dart';
import 'activityScreenBooking.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState
    extends BaseView<GetActivitiesScreenViewModel, ActivityScreen>
    implements GetActivitiesConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
    viewModel.getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<GetActivitiesScreenViewModel>(
            builder: (context, value, child) =>
                BuildHeaderForChooseSpecificLocation(
                  questionText: Text(
                    LocaleKeys.activity_screen_where_do_you_want_to_move_from
                        .tr(),
                    style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.045,
                        fontWeight:
                            FontWeight.bold), // حجم الخط بناءً على العرض
                  ),
                  changeSearchBool: value.changeSearchBool,
                  getServiceItems: value.showActivity,
                  isSearchPressed: value.isSearchPressed,
                  changeLocation: value.changeDestination,
                  location: value.destinationLanguage,
                )));
  }

  @override
  GetActivitiesScreenViewModel init_my_view_model() {
    GetActivitySupebaseService getActivitySupebaseService =
        GetActivitySupebaseService();
    GetActivitySupabaseRepo getActivitySupabaseRepo =
        GetActivitySupabaseRepo(getActivitySupebaseService);
    // TODO: implement init_my_view_model
    return GetActivitiesScreenViewModel.getInstance(getActivitySupabaseRepo);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }

  @override
  Widget emptyData() {
    return Expanded(
      child: Center(
        child: Text(
          LocaleKeys.activity_screen_no_activity_found.tr(), // مفتاح الترجمة
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  @override
  gridViewData(List<ActivityModel> activity) {
    double spetRatio =
        (AppConstants.screenWidth * 0.86) / (AppConstants.screenHeight * 0.5);
    print("ratio $spetRatio");

    // TODO: implement gridViewData
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // سيارتين في كل صف
                crossAxisSpacing: 0.033 * AppConstants.screenWidth,
                mainAxisSpacing: 0.0154 * AppConstants.screenHeight,
                childAspectRatio: spetRatio),
            itemCount: activity.length,
            itemBuilder: (context, index) {
              var activityData = activity[index];

              return SingleChildScrollView(
                child: SearchResultScreen(
                  bookingNav: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityScreenBooking(
                                activityModel: activityData,
                              )),
                    );
                  },
                  imageUrl: activityData.itemImageUrl,
                  itemName: activityData.itemName,
                  location: activityData.itemAddress,
                ),
              );
            }));
  }
}
