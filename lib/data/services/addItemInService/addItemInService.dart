import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddItemInServiceTableToSupabase {
  final supabase = Supabase.instance.client;

  addItem(BaseItemInServiceModel itemInService, String ServicNane) async {
   try{
    await supabase.from(ServicNane).insert(itemInService.toJson());
  }catch(E){
     print(E.toString());
     throw Exception(E.toString());
   }
   }
}
