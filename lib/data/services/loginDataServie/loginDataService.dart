import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/userModel/userModel.dart';

class LoginDataService {
  FirebaseFirestore fireStore;

  LoginDataService(this.fireStore);

  Future<void> uploadUserDataToDatabase({required UserModel user}) async {
  await  fireStore.collection("users_development").doc(user.id)
      .set(user.toJson());
  }
}
