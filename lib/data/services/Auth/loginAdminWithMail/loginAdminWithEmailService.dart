import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manafea/config/error_handling/errorHandling.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';

class LoginAdminWithEmailFirebaseService {
  final box = GetStorage();

  Future<Result> login({
    required String email,
    required String employeeId,
  }) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("Employee")
          .where("email", isEqualTo: email)
          .where("employeeId", isEqualTo: employeeId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        box.write(SharedSharedPreferencesKeys.isAdminLogin,true);
        final isAdminLogin = box.read(SharedSharedPreferencesKeys.isAdminLogin) ?? false;
print("object $isAdminLogin");

        return Result.success("Has been login");
      } else {
        return Result.failure("Email or Password is not correct ");
      }
    } catch (e) {
      return Result.failure("Something went wrong !");
    }
  }
}
