import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addActivity/view/addActivity.dart';

import '../../../domain/models/activityModel/activityModel.dart';

abstract class GetActivitiesConnector extends BaseConnector{
  @override
  onError(String message) {
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }


  gridViewData(List<ActivityModel> activity);
  emptyData();
}