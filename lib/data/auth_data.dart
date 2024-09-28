import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiem_tra_1/data/firestor.dart';

abstract class AuthenticationDatasource {
  Future<void> register(String email, String password, String PasswordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<bool> login(String email, String password) async {
    // Thực hiện các thao tác đăng nhập, ví dụ:
    try {
      // Ví dụ sử dụng Firebase
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Nếu đăng nhập thành công, trả về true
      return true;
    } catch (e) {
      // Nếu có lỗi xảy ra, trả về false
      return false;
    }
  }

  @override
  Future<void> register(
      String email, String password, String PasswordConfirm) async {
    if (PasswordConfirm == password) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        Firestore_Datasource().CreateUser(email);
      });
    }
  }
}
