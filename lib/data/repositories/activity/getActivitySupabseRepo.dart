import 'package:manafea/data/services/activity/getActivity.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class GetActivitySupabaseRepo {
  GetActivitySupebaseService getActivitySupebaseService;

  GetActivitySupabaseRepo(this.getActivitySupebaseService);

  Future<List<ActivityModel>> getActivities() async {
    try {
      return await getActivitySupebaseService.getAgectivities();
    } catch (e) {
      print("error $e");
      throw Exception(e.toString());
    }
  }
}
