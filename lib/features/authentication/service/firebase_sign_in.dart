import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService extends GetxService {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
