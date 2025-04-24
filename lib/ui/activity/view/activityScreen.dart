import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/activity/getActivitySupabseRepo.dart';
import 'package:manafea/data/services/activity/getActivity.dart';
import 'package:manafea/ui/activity/connector/getActivitesConnector.dart';
import 'package:manafea/ui/activity/viewModel/getActivitesScreenViewModel.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../widget/getActivitiesScreen/activityScreenItem.dart';

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
            builder: (context, value, child) => ActivityScreenItem(
              changeSearchBool: value.changeSearchBool,
              getActivities: value.showActivity,
              isSearchPressed: value.isSearchPressed,
                  changeDestination: value.changeDestination,
                  selectedDestination: value.destination,
                ))) ;
  }

  @override
  GetActivitiesScreenViewModel init_my_view_model() {
    GetActivitySupebaseService getActivitySupebaseService =
        GetActivitySupebaseService();
    GetActivitySupabaseRepo getActivitySupabaseRepo =
        GetActivitySupabaseRepo(getActivitySupebaseService);
    // TODO: implement init_my_view_model
    return GetActivitiesScreenViewModel(getActivitySupabaseRepo);
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
}
