import 'package:manafea/config/base_class.dart';

abstract class PersonalDetailedConnector extends BaseConnector{
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
  navigateToHomeScreen();

}