import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class GetServiceDataSupabaseService {
final supabase = Supabase.instance.client;

Future<List<T>> getService<T extends BaseItemInServiceModel>({
  required String service,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  final activities = await supabase
      .from(service)
      .select()
      .withConverter<List<T>>(
        (data) => (data as List<dynamic>)
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList(),
  );
  return activities;
}
}