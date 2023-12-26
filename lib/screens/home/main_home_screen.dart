import 'package:chatbox/screens/splash/splash_screen.dart';
import 'package:chatbox/service/authentication/firebase_sign_in.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FirebaseService();

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              service.signOunt();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ));
            },
            child: const Text('Sign Out'),
          )
        ],
      ),
    ));
  }
}
