import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpService extends GetxService {
  Future<String?> signUpUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return "SignUp Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } catch (e) {
      return "Gettting error in signup";
    }
  }
}
