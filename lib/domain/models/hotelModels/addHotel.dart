import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class AddHotelModel  extends BaseItemInServiceModel {

  String commonRoomPricing;
  String specialRoomPricing;
  String country;

  AddHotelModel._({
    required String name,
    required String description,
    required String imageUrl,
    required int pricing,
    required this.commonRoomPricing,
    required this.country,
    required this.specialRoomPricing,
     required String address,
  }) : super(
    itemAddress: address,
    itemDescription: description,
    itemImageUrl: imageUrl,
    itemName: name,
    itemPricing: pricing,
  );

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['commonRoomPricing']=commonRoomPricing;
    json['country']=country;
    json['specialRoomPricing']=specialRoomPricing;
     return json;
  }

  factory AddHotelModel.fromJson(Map<String, dynamic> json) {
    return AddHotelModel._(
      name: json['itemName'],
      country: json['country'],
      specialRoomPricing: json['specialRoomPricing'],
      commonRoomPricing: json['commonRoomPricing'],
      description: json['itemDescription'],
      imageUrl: json['itemImageUrl'],
      address: json['itemAddress'],
      pricing: json['itemPricing'],
     );
  }
}
  class AddHotelBuilder  extends BaseItemBuilder
<AddHotelModel,AddHotelBuilder> {
  String? name;
  String? description;
  String? imageUrl;
  int? pricing;
  String? address;
  String? country;
  String ?commonRoomPricing;
  String ?specialRoomPricing;

  AddHotelBuilder setCommonRoomPricing(String commonPricing) {
    this.commonRoomPricing = commonPricing;
    return this  ;
  }
  AddHotelBuilder setCountry(String countryName) {
    this.country = countryName;
    return this  ;
  }

  AddHotelBuilder setSpecialRoomPricing(String specialPricing) {
    this.specialRoomPricing = specialPricing;
    return this  ;
  }
  AddHotelBuilder setName(String name) {
    this.name = name;
    return this  ;
  }

  AddHotelBuilder setDescription(String description) {
    this.description = description;
    return this ;
  }

  AddHotelBuilder setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
    return this ;
  }

  AddHotelBuilder setPricing(int pricing) {
    this.pricing = pricing;
    return this ;
  }

  AddHotelBuilder setAddress(String address) {
    this.address = address;
    return this ;
  }


  @override
  AddHotelModel build() {
    return AddHotelModel._(
      commonRoomPricing: commonRoomPricing??'',
      specialRoomPricing: commonRoomPricing??'',
      name: name ?? '',
      country: country ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      pricing: pricing ?? 0,
      address: address ?? '',
     );
  }
}