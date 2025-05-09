import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class GetActivitySupebaseService {
  final supabase = Supabase.instance.client;

  Future<Result<List<ActivityModel>>> getAgectivities() async {
    try {
      final activities = await supabase
          .from("activities")
          .select()
          .withConverter<List<ActivityModel>>(
            (data) => (data as List<dynamic>)
                .map((item) => ActivityModel.fromJson(item))
                .toList(),
          );
      return Result.success(activities);
    } catch (e) {
      return Result.failure("Some thing went wrong please try again");
    }
  }
}
