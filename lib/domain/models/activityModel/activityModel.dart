import 'package:manafea/domain/models/baseItemInServiceModel/baseItemInServiceModel.dart';

class ActivityModel extends BaseItemInServiceModel {
  String destination;

  ActivityModel._({
    required String name,
    required String description,
    required String imageUrl,
    required int pricing,
    required this.destination,
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
    json['destination'] = destination;
    return json;
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel._(
      name: json['itemName']??'',
      description: json['itemDescription']??'',
      imageUrl: json['itemImageUrl']??'',
      address: json['itemAddress']??'',
      pricing: json['itemPricing']??'',
      destination: json['destination']??'',
    );
  }


}

  class ActivityModelBuilder
    extends BaseItemBuilder<ActivityModel, ActivityModelBuilder> {
  String? name;
  String? description;
  String? imageUrl;
  int? pricing;
  String? address;
  String? destination;

  ActivityModelBuilder setName(String name) {
    this.name = name;
    return this;
  }

  ActivityModelBuilder setDescription(String description) {
    this.description = description;
    return this;
  }

  ActivityModelBuilder setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
    return this;
  }

  ActivityModelBuilder setPricing(int pricing) {
    this.pricing = pricing;
    return this;
  }

  ActivityModelBuilder setAddress(String address) {
    this.address = address;
    return this;
  }

  ActivityModelBuilder setDestination(String destination) {
    this.destination = destination;
    return this;
  }

  @override
  ActivityModel build() {
    return ActivityModel._(
      name: name ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      pricing: pricing ?? 0,
      address: address ?? '',
      destination: destination ?? '',
    );
  }
}
