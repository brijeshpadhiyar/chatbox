import 'package:chatbox/constant/colors.dart';
import 'package:chatbox/constant/images.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:chatbox/features/onBoardingScreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: 71.h,
              width: 59.17.w,
              AppImage.logo,
            ),
            Text(
              AppTexts.appName,
              style: GoogleFonts.aBeeZee(
                fontSize: 40.sp,
                color: AppColors.color815,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
