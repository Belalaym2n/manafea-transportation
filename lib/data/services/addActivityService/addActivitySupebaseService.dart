import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddItemInServiceTableToSupabase{
  final supabase = Supabase.instance.client;

  addItem(BaseItemInServiceModel itemInService,String ServicNane
      ) async {
    final insertResponse =
        await supabase.from(ServicNane).insert(itemInService.toJson());
  }
}
