import 'package:chatbox/constant/colors.dart';
import 'package:chatbox/constant/text_styles.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/images.dart';
import '../../../widgets/authentication/circle_icon_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    String password = '';
    String email = '';
    final passwordController = TextEditingController();

    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Text(
                  AppTexts.loginChatBox,
                  style: authenticationTopTextStyle(),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Center(
                  child: Text(
                    AppTexts.loginScreenText1,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: authenticationTopTextStyle1(),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomeIcon(
                    imagePath: AppImage.facebookLogo,
                    borderColor: AppColors.color000,
                  ),
                  SizedBox(width: 30.w),
                  CustomeIcon(
                    imagePath: AppImage.googleLogo,
                    borderColor: AppColors.color000,
                  ),
                  SizedBox(width: 30.w),
                  CustomeIcon(
                    imagePath: AppImage.appleWhiteLogo,
                    imageColor: AppColors.color000,
                    borderColor: AppColors.color000,
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
                      color: AppColors.colorC7B,
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
              TextFormField(
                controller: emailController,
                onChanged: (value) => email = value,
                validator: (value) {
                  var error = validateEmail(value);
                  return error;
                },
                cursorColor: AppColors.color86D,
                decoration: InputDecoration(
                  labelText: AppTexts.yourEmail,
                  suffixIcon: email.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            emailController.clear();
                            email = '';
                          },
                          icon: const Icon(Icons.close_sharp))
                      : null,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color1D0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color86D)),
                  labelStyle: textButtonLabelStyle(),
                ),
              ),
              const Spacer(),
              TextFormField(
                controller: passwordController,
                onChanged: (value) => password = value,
                cursorColor: AppColors.color86D,
                decoration: InputDecoration(
                  labelText: AppTexts.password,
                  suffixIcon: password.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            passwordController.clear();
                            password = '';
                          },
                          icon: const Icon(Icons.close_sharp))
                      : null,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color1D0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color86D)),
                  labelStyle: textButtonLabelStyle(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: email.isEmpty && password.isEmpty
                      ? AppColors.color6F6
                      : AppColors.color86D,
                  elevation: 0,
                  maximumSize: Size(327.w, 48.h),
                  minimumSize: Size(327.w, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Text(
                  AppTexts.login,
                  style: GoogleFonts.cabin(
                    color: email.isEmpty && password.isEmpty
                        ? AppColors.colorC7B
                        : AppColors.colorFFF,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppTexts.forgotPassword,
                  style: textButtonLabelStyle(),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
