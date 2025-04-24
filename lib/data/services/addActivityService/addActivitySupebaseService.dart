import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddActivityToSupabaseService{
  final supabase = Supabase.instance.client;

  addActivity(ActivityModel activity) async {
    final insertResponse =
        await supabase.from('activities').insert(activity.toJson());
  }
}
