import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class AddCarModel extends BaseItemInServiceModel{
  AddCarModel._({
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

  factory AddCarModel.fromJson(Map<String, dynamic> json) {
    return AddCarModel._(
      name: json['itemName'],
      description: json['itemDescription'],
      imageUrl: json['itemImageUrl'],
      address: json['itemAddress'],
      pricing: json['itemPricing'],
    );
  }

}


class CarBuilder extends BaseItemBuilder<
AddCarModel ,CarBuilder>{
  @override
  AddCarModel build() {
    // TODO: implement build

    return AddCarModel._(
      name: itemName??"",
      description: itemDescription??"",
      address: itemAddress??'',
      imageUrl: itemImageUrl??"",
      pricing: itemPricing??0,
    );
  }

}