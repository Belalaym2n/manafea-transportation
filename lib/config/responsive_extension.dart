import 'appConstants.dart';

extension ResponsiveExtension  on num {
  double get w => this * AppConstants.screenWidth;
  double get h => this * AppConstants.screenHeight;
}