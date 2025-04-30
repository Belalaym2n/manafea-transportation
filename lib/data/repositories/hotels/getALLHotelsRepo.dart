import 'package:manafea/data/services/hotels/getAllHotelsSupabaseService.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';

import '../../../domain/models/hotelModels/addHotel.dart';

class GetAllHotelsRepo {
  GetAllHotelsSupabaseService getHotelsSupabaseService;

  GetAllHotelsRepo(this.getHotelsSupabaseService);

  Future<List<AddHotelModel>> getHotels() async {
    try {
      return await getHotelsSupabaseService.getHotels();
    } catch (e) {
      print("error $e");
      throw Exception(e.toString());
    }
  }
}