import 'package:manafea/config/base_class.dart';

abstract class AddActivityConnector extends BaseConnector{
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


  successWidget();
}