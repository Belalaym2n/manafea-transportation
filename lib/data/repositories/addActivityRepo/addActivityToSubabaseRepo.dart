import 'package:manafea/data/services/addActivityService/addActivitySupebaseService.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class AddActivityToSupabseRepo{
  AddActivityToSupabaseService addActivityToSupabase;
  AddActivityToSupabseRepo(this.addActivityToSupabase);

  addActivity(ActivityModel activity) async {
    try{
      await addActivityToSupabase.addActivity(activity);
    }catch(E){
      throw Exception();
    }
  }
}