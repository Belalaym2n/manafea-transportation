import '../../../config/error_handling/errorHandling.dart';
import '../../../domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';
import '../../services/getServiecesDataFromSupabase/getServicesDataFromSupabaseService.dart';

class GetServiceDataSupabaseRepo {
  final GetServiceDataSupabaseService getService;

  GetServiceDataSupabaseRepo(this.getService);

  Future<Result<List<T>>> getSpecificService<T extends BaseItemInServiceModel>({
    required String service,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    return await getService.getService<T>(service: service, fromJson:
    fromJson);
  }
}
