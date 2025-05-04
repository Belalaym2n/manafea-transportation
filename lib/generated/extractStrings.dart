import 'dart:convert';
import 'dart:io';

void main() async {
  final regex = RegExp(r'"([^"\\]*(\\.[^"\\]*)*)"');
  final sourceDirectory = Directory('./lib');

  final dartFiles = await sourceDirectory
      .list(recursive: true)
      .where((file) => file.path.endsWith('.dart'))
      .toList();

  final Map<String, String> enMap = {};
  final Map<String, String> arMap = {};

  for (final file in dartFiles) {
    final lines = await File(file.path).readAsLines();

    for (final line in lines) {
      for (final match in regex.allMatches(line)) {
        final extractedText = match.group(1)!;

         if (_shouldSkip(extractedText)) continue;

        final key = _generateKey(extractedText);
        enMap[key] = extractedText;
        arMap[key] = '';
       }
    }
  }

  await _saveJson('./assets/translations/en.json', enMap);
  await _saveJson('./assets/translations/ar.json', arMap);

  print('✅ Extraction completed. ${enMap.length} entries saved.');
}

bool _shouldSkip(String text) {
  return text.length < 3 ||
      text.contains('{') ||
      text.contains('}') ||
      text.contains('://') ||
      text.contains('=') ||
      RegExp(r'\$\w+').hasMatch(text);
 }

String _generateKey(String text) {
  String key = text
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), ' ')
      .trim()
      .replaceAll(RegExp(r'\s+'), '_');

  return key.length > 40 ? key.substring(0, 40) : key;
}

Future<void> _saveJson(String path, Map<String, String> data) async {
  final file = File(path);
  final encoder = JsonEncoder.withIndent('  ');
  await file.create(recursive: true);
  await file.writeAsString(encoder.convert(data));
}
