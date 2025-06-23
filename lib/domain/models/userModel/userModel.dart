class UserModel {
  final String firstName;
  final String lastName;
  final String? email;
  final String? id;
  final String? phoneNumber; // خلتها nullable

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.id,
    this.email,
    this.phoneNumber, // بقت مش مطلوبة
  });

  Map<String, dynamic> toJson() {
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
    };
    if (email != null||email!='') {
      data['email'] = email!;
    }
    if (phoneNumber != null||phoneNumber!='') {
      data['phoneNumber'] = phoneNumber!;
    }

    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? 'not exist ',
    );
  }

  static UserModelBuilder builder() => UserModelBuilder();
}

class UserModelBuilder {
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _email;
  String? _id;

  UserModelBuilder setFirstName(String firstName) {
    _firstName = firstName;
    return this;
  }

  UserModelBuilder setId(String id) {
    _id = id;
    return this;
  }
  UserModelBuilder setEmail(String email) {
    _email = email;
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
      id: _id ?? "",
      email: _email ?? "",
      firstName: _firstName ?? '',
    );
  }
}
