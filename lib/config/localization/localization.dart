import 'package:flutter/material.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> loadSavedLanguage() async {
    final langCode = SharedPreferencesHelper.getData('lang_code') ?? 'en';
    _locale = Locale(langCode);
    notifyListeners();
  }

  Future<void> changeLanguage(Locale newLocale) async {
    _locale = newLocale;
    await SharedPreferencesHelper.saveData(
        key: 'lang_code', value: newLocale.languageCode);
    notifyListeners();
  }
}
