import 'package:chatbox/blocs/Authentication/authentication_bloc.dart';
import 'package:chatbox/screens/home/main_home_screen.dart';
import 'package:chatbox/screens/splash/splash_screen.dart';
import 'package:chatbox/service/authentication/authentication_service.dart';
import 'package:chatbox/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return BlocProvider(
        create: (context) => authenticationBloc,
        child: const MyApp(),
      );
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AuthenticationService();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: state is UserLoggedState
              ? const MainHomeScreen()
              : const SplashScreen());
    });
  }
}
