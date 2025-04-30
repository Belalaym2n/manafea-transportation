import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/hotelModels/addHotel.dart';

class GetAllHotelsSupabaseService {
  final supabase=Supabase.instance.client;


  Future<List<AddHotelModel>> getHotels() async {
    final hotels = await supabase
        .from("hotels")
        .select()
        .withConverter<List<AddHotelModel>>(
          (data) => (data as List<dynamic>)
          .map((item) => AddHotelModel.fromJson(item))
          .toList(),
    );
    return hotels;
  }
}