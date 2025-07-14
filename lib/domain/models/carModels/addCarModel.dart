import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class CarModel extends BaseItemInServiceModel{
  CarModel._({
    required String name,
    required String description,
    required String imageUrl,
    required int pricing,
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
    return json;
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel._(
      name: json['itemName']??'',
      description: json['itemDescription']??'',
      imageUrl: json['itemImageUrl']??'',
      address: json['itemAddress']??'',
      pricing: json['itemPricing']??'',
    );
  }

}


class CarBuilder extends BaseItemBuilder<
    CarModel ,CarBuilder>{
  @override
  CarModel build() {
    // TODO: implement build

    return CarModel._(
      name: itemName??"",
      description: itemDescription??"",
      address: itemAddress??'',
      imageUrl: itemImageUrl??"",
      pricing: itemPricing??0,
    );
  }

}