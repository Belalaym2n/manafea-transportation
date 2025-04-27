import 'package:manafea/data/services/addActivityService/addActivitySupebaseService.dart';
import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

import '../../../domain/models/activityModel/activityModel.dart';

class AddItemInServiceTableToSupabseRepo{
  AddItemInServiceTableToSupabase addActivityToSupabase;
  AddItemInServiceTableToSupabseRepo(this.addActivityToSupabase);

  addItemInService(BaseItemInServiceModel item,String serviceName) async {
    try{
      await addActivityToSupabase.addItem(item,serviceName);
    }catch(E){
      throw Exception(E.toString());
    }
  }
}