import 'package:flutter/cupertino.dart';
import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class AddHotelModel  extends BaseItemInServiceModel {

  int commonRoomPricing;
  int specialRoomPricing;
  String googleMapsUrl;

  String country;

  AddHotelModel._({
    required String name,
    required String description,
    required String imageUrl,
    required int pricing,
    required this.commonRoomPricing,
    required this.googleMapsUrl,
    required this.country,
    required this.specialRoomPricing,
     required String address,
  }) : super(
    itemAddress: address,
    itemDescription: description,
    itemImageUrl: imageUrl,
    itemName: name,
    itemPricing : pricing,
  );

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['commonRoomPricing']=commonRoomPricing;
    json['googleMapsUrl']=googleMapsUrl;
    json['country']=country;
    json['specialRoomPricing']=specialRoomPricing;
     return json;
  }

  factory AddHotelModel.fromJson(Map<String, dynamic> json) {
    return AddHotelModel._(
      name: json['itemName']??'',
      googleMapsUrl: json['googleMapsUrl']??'',
      country: json['country'],
      specialRoomPricing: json['specialRoomPricing']??'',
      commonRoomPricing: json['commonRoomPricing']??'',
      description: json['itemDescription']??'',
      imageUrl: json['itemImageUrl']??'',
      address: json['itemAddress']??'',
      pricing: json['itemPricing']??'',
     );
  }
}
  class AddHotelBuilder  extends BaseItemBuilder
<AddHotelModel,AddHotelBuilder> {
       String? country;
  int ?commonRoomPricing;
  int ?specialRoomPricing;
       String? googleMapsUrl;
       AddHotelBuilder setGoogleMapsUrl(String url) {
         this.googleMapsUrl = url;
         return this;
       }
  AddHotelBuilder setCommonRoomPricing(int commonPricing) {
    this.commonRoomPricing = commonPricing;
    return this  ;
  }
  AddHotelBuilder setCountry(String countryName) {
    this.country = countryName;
    return this  ;
  }

  AddHotelBuilder setSpecialRoomPricing(int specialPricing) {
    this.specialRoomPricing = specialPricing;
    return this  ;
  }






  @override
  AddHotelModel build() {
    return AddHotelModel._(
      commonRoomPricing: commonRoomPricing??0,
      googleMapsUrl: googleMapsUrl??"",
      specialRoomPricing: commonRoomPricing??0,
      name: itemName ?? '',
      country: country ?? '',
      description: itemDescription ?? '',
      imageUrl: itemImageUrl ?? '',
      pricing: itemPricing ?? 0,
      address: itemAddress ?? '',
     );
  }
}