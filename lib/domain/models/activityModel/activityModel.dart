class ActivityModel{
  String name;
  String description;
  String imageUrl ;
  String address ;
  int pricing ;
  String destination;
  ActivityModel({
    required this.name,
    required this.description,
     required this.imageUrl,
    required this.pricing,
    required this.destination,
    required this.address,

});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
       'imageUrl': imageUrl,
      'address': address,
      'pricing': pricing,
      'destination': destination,
    };
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      name: json['name'],
      description: json['description'],
       imageUrl: json['imageUrl'],
      address: json['address'],
      pricing: json['pricing'],
      destination: json['destination'],
    );
  }
}