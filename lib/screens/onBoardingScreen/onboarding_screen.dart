import 'package:chatbox/blocs/Authentication/authentication_bloc.dart';
import 'package:chatbox/constant/colors.dart';
import 'package:chatbox/constant/images.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:chatbox/screens/home/main_home_screen.dart';
import 'package:chatbox/screens/splash/splash_screen.dart';
import 'package:chatbox/service/authentication/firebase_sign_in.dart';
import 'package:chatbox/screens/authentication/login/login_screen.dart';
import 'package:chatbox/screens/authentication/signup/signup_screen.dart';
import 'package:chatbox/widgets/authentication/circle_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UserLoggedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainHomeScreen()),
          );
        } else if (state is UserNotLoggedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen()),
          );
        }
        // Handle other states if needed
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 1.sh,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.colorA1A,
                      AppColors.color566,
                      AppColors.colorA1A
                    ],
                    stops: const [0.1, 1.1, 0.5],
                    transform: const GradientRotation(40),
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated,
                  ),
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 15.54.w,
                        height: 18.74.h,
                        AppImage.c,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        AppTexts.appName,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          color: AppColors.colorFFF,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppTexts.authText1,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 68.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorFFF,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppTexts.authText2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.color1BE,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CustomeIcon(AppImage.facebookLogo),
                      CustomeIcon(
                        imagePath: AppImage.facebookLogo,
                        borderColor: AppColors.colorFFF,
                      ),
                      SizedBox(width: 30.w),
                      InkWell(
                        onTap: () => FirebaseService().signInWithGoogle(),
                        child: CustomeIcon(
                          imagePath: AppImage.googleLogo,
                          borderColor: AppColors.colorFFF,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      CustomeIcon(
                        imagePath: AppImage.appleWhiteLogo,
                        borderColor: AppColors.colorFFF,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 132.w,
                        height: 0.3.h,
                        color: AppColors.color1BE,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          color: AppColors.colorFFF,
                          fontSize: 14.sp,
                        ),
                      ),
                      Container(
                        width: 132.w,
                        height: 0.3.h,
                        color: AppColors.color1BE,
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorFFF,
                        fixedSize: Size(327.w, 48.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r))),
                    child: Text(
                      'Sign up withn mail',
                      style: GoogleFonts.cabin(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: AppColors.color000,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Existing account? ',
                            style: GoogleFonts.actor(
                              fontSize: 16.sp,
                              color: AppColors.color1BE,
                            ),
                          ),
                          TextSpan(
                            text: 'Log in',
                            style: GoogleFonts.actor(
                              fontSize: 16.sp,
                              color: AppColors.colorFFF,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
