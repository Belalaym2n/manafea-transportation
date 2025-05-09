import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/data/services/activity/getActivity.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class GetActivitySupabaseRepo {
  GetActivitySupebaseService getActivitySupebaseService;

  GetActivitySupabaseRepo(this.getActivitySupebaseService);

  Future<Result<List<ActivityModel>>> getActivities() async {
    return await getActivitySupebaseService.getAgectivities();
  }
}
