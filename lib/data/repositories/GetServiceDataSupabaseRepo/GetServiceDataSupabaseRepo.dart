import '../../../domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';
import '../../services/getServiecesDataFromSupabase/getServicesDataFromSupabaseService.dart';

class GetServiceDataSupabaseRepo {
  final GetServiceDataSupabaseService getService;

  GetServiceDataSupabaseRepo(this.getService);

   Future<List<T>> getSpecificService<T extends BaseItemInServiceModel>({
    required String service,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
       return await getService.getService<T>(
        service: service,
        fromJson: fromJson,
      );
    } catch (e) {
       throw Exception(e.toString());
    }
  }
}
