import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class GetActivitySupebaseService{
  final supabase=Supabase.instance.client;


  Future<List<ActivityModel>> getAgectivities() async {
    final activities = await supabase
        .from("activities")
        .select()
        .withConverter<List<ActivityModel>>(
          (data) => (data as List<dynamic>)
          .map((item) => ActivityModel.fromJson(item))
          .toList(),
    );
    return activities;
  }
}