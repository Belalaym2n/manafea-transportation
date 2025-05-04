import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

void main() async {
  // تحميل البيانات من ملف JSON
  var file = File('path_to_your_file/en.json');
  var content = await file.readAsString();
  var jsonData = json.decode(content);

   replaceTextWithLocale(jsonData);
}

void replaceTextWithLocale(Map<String, dynamic> jsonData) {
  jsonData.forEach((key, value) {
    if (value is Map) {
      value.forEach((subKey, subValue) {
        if (subValue is String) {
          String replacedText = convertToLocale(subValue);
          print('Original: $subValue, Replaced: $replacedText');
        }
      });
    } else if (value is String) {
      String replacedText = convertToLocale(value);
      print('Original: $value, Replaced: $replacedText');
    }
  });
}

// دالة لتحويل النصوص إلى `LocaleKeys` المناسبة
String convertToLocale(String text) {
  // تأكد من أن النص لا يحتوي على مسافات أو أحرف غير ضرورية
  var formattedText = text.replaceAll(' ', '_').toLowerCase();
  return 'LocaleKeys.${formattedText.tr()}';
}

