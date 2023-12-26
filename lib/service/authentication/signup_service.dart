import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {
  Future<String?> signUpUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } catch (e) {
      return "Error in Signup : $e";
    }
    return null;
  }
}
