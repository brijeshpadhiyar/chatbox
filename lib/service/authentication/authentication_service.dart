import 'package:chatbox/screens/home/main_home_screen.dart';
import 'package:chatbox/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AutheService extends GetxService {
  static AutheService get instance => Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SplashScreen());
    } else {
      Get.offAll(() => const MainHomeScreen());
    }
  }
}
