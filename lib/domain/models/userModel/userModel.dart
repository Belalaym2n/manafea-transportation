class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel({
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  static UserModelBuilder builder() => UserModelBuilder();
}

class UserModelBuilder {
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;

  UserModelBuilder setFirstName(String firstName) {
    _firstName = firstName;
    return this;
  }

  UserModelBuilder setLastName(String lastName) {
    _lastName = lastName;
    return this;
  }

  UserModelBuilder setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    return this;
  }

  UserModel build() {
    return UserModel(
      phoneNumber: _phoneNumber ?? '',
      lastName: _lastName ?? "",
      firstName: _firstName ?? '',
    );
  }
}
