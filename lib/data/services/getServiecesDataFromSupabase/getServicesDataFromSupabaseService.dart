import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../config/error_handling/errorHandling.dart';
import '../../../domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class GetServiceDataSupabaseService {
  final supabase = Supabase.instance.client;

  Future<Result<List<T>>> getService<T extends BaseItemInServiceModel>({
    required String service,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final items = await supabase
          .from(service)
          .select()
          .withConverter<List<T>>(
            (data) => (data as List<dynamic>)
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList(),
      );
      return Result.success(items);  // إعادة النتيجة بنجاح
    } catch (e) {
      return Result.failure('Error fetching data from $service: ${e.toString()}');  // إعادة الخطأ في حال حدوث مشكلة
    }
  }
}
