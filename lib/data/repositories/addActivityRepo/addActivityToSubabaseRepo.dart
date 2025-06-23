  import '../../../data/services/addItemInService/addItemInService.dart';
 import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';


class AddItemInServiceTableToSupabseRepo{
  AddItemInServiceTableToSupabase addItemInServiceTableToSupabase;
  AddItemInServiceTableToSupabseRepo(this.addItemInServiceTableToSupabase);

  addItemInService(BaseItemInServiceModel item,String serviceName) async {
    try{
      await addItemInServiceTableToSupabase.addItem(item,serviceName);
    }catch(E){
      throw Exception(E.toString());
    }
  }
}