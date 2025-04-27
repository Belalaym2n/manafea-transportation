  class BaseItemInServiceModel {
  final String itemName;
  final String itemDescription;
  final String itemImageUrl;
  final String itemAddress;
  final int itemPricing;

  BaseItemInServiceModel({
    required this.itemName,
    required this.itemDescription,
    required this.itemImageUrl,
    required this.itemAddress,
    required this.itemPricing,
  });


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'itemDescription': itemDescription,
      'itemImageUrl': itemImageUrl,
      'itemAddress': itemAddress,
      'itemPricing': itemPricing,
    };
  }

 }
abstract class BaseItemBuilder<T extends BaseItemInServiceModel,
B extends BaseItemBuilder<T, B>> {
  String? itemName;
  String? itemDescription;
  String? itemImageUrl;
  String? itemAddress;
  int? itemPricing;

  B setItemName(String name) {
    itemName = name;
    return this as B;
  }

  B setItemDescription(String description) {
    itemDescription = description;
    return this as B;
  }

  B setItemImageUrl(String url) {
    itemImageUrl = url;
    return this as B;
  }

  B setItemAddress(String address) {
    itemAddress = address;
    return this as B;
  }

  B setItemPricing(int pricing) {
    itemPricing = pricing;
    return this as B;
  }

  T build();
}

