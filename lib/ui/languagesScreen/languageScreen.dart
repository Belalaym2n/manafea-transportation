import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/localization/localization.dart';
import '../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../generated/locale_keys.g.dart';
import 'languageSwitch.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String selectedLanguage;

  //= await SharedPreferencesHelper.getData('lang_code') ?? 'en';

  void changeLanguage(String langCode) {
    setState(() {
      selectedLanguage = langCode;
    });
    context.read<LanguageProvider>().
    changeLanguage(Locale(langCode));
    context.setLocale(Locale(langCode));
    setState(() {

    });
  }

  getLocale() async {
    selectedLanguage =
        await SharedPreferencesHelper.getData('lang_code') ?? 'en';
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
              Center(
              child: Text(
                  LocaleKeys.onboard_1_headline.tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            LanguageSwitchTile(
              languageName: "العربية",
              isSelected: selectedLanguage == 'ar',
              onTap: () => changeLanguage('ar'),
            ),
            LanguageSwitchTile(
              languageName: "English",
              isSelected: selectedLanguage == 'en',
              onTap: () => changeLanguage('en'),
            ),
            LanguageSwitchTile(
              languageName: "Urdu",
              isSelected: selectedLanguage == 'ur',
              onTap: () => changeLanguage('ur'),
            ),
          ],
        ),
      ),
    );
  }
}
