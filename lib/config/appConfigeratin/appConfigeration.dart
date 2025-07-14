class AppConfiguration{

  static late String flavor;

  static bool get isDev => flavor == 'development';
  static bool get isProd => flavor == 'production';


  static String get usersCollectionName =>
      isDev ? 'users_development' : 'Users';
  static String get ordersCollectionName =>
      isDev ? 'Orders_development' : 'Orders';
  static String get employeeCollectionName =>
      isDev ? 'Employee_development' : 'Employee';

  static String get carsCollectionName =>
      isDev ? 'cars_development' : 'Cars';


  static String get activitiesCollectionName =>
      isDev ? 'activities_development' : 'activities';

  static String get hotelsCollectionName =>
      isDev ? 'hotels_development' : 'hotels';
}

