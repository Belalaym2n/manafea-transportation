 import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;
// المتغير الجلوبال

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();

  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await _preferences!.setString(key, value);
    } else if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else {
      throw Exception("Invalid value type");
    }
  }
  static void loadUserDataForOrders({
    required TextEditingController phoneController,
  required  TextEditingController nameController,

  }) async {
    final phone = await SharedPreferencesHelper
    .getData(SharedSharedPreferencesKeys.phoneOrder);
    final name = await SharedPreferencesHelper.
    getData(SharedSharedPreferencesKeys.nameOrder);

    if (phone != null) phoneController.text = phone;
     if (name != null) nameController .text = name;

    print("Cached Data Loaded: Phone: $phone, Address: $name");
  }


  static dynamic getData(String key) {
    return _preferences!.get(key);
  }

  static Future<bool> clearAll() async {
    return await _preferences!.clear();
  }
}

class SharedSharedPreferencesKeys{
  static const String  phoneNumberKey='phoneNumber';
  static const String  userId='userId';
  static const String  email='email';
  static const String  name='name';


  // related of admin auth
  static const String isAdminLogin="isAdminLogin";
  // related of contact order
  static const String  nameOrder='nameOrder';
  static const String  phoneOrder='phoneOrder';
  static const String  signInWithEmail='signInWithEmail';
  static const String  isCreatedAccount='createAccount';
  static const String  firsName='firstName';
  static const String  lastName='lastName';
}
