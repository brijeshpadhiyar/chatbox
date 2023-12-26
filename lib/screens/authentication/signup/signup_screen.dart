import 'package:chatbox/constant/text_styles.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:chatbox/service/authentication/signup_service.dart';
import 'package:chatbox/widgets/errorShow/custome_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final service = SignUpService();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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

  String? validateConfirmPassword(String? value) {
    if (password != confirmPassword) {
      return "Passwords doesn't match";
    }
    return null;
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  Future<void> signUpUser(String email, String password) async {
    final message = await service.signUpUser(email, password);

    if (mounted) {
      if (message == null) {
        CustomSnackbar.show(
            context: context, title: 'Success', message: 'Sign up successful');
      } else {
        CustomSnackbar.show(context: context, title: 'Error', message: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50.h),
                      Center(
                        child: Text(
                          AppTexts.signUpWithEmail,
                          style: authenticationTopTextStyle(),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Center(
                          child: Text(
                            AppTexts.signUpScreenText1,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: authenticationTopTextStyle1(),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      TextFormField(
                        controller: nameController,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Name please";
                          }
                          return null;
                        },
                        cursorColor: AppColors.color86D,
                        decoration: InputDecoration(
                          labelText: AppTexts.yourName,
                          suffixIcon: name.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      nameController.clear();
                                      name = '';
                                    });
                                  },
                                  icon: const Icon(Icons.close_sharp))
                              : null,
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: emailController,
                        onChanged: (value) => setState(() {
                          email = value;
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter email";
                          }
                          var error = validateEmail(value);
                          return error;
                        },
                        cursorColor: AppColors.color86D,
                        decoration: InputDecoration(
                          labelText: AppTexts.yourEmail,
                          suffixIcon: email.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      emailController.clear();
                                      email = '';
                                    });
                                  },
                                  icon: const Icon(Icons.close_sharp))
                              : null,
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: '*',
                        onChanged: (value) => setState(() {
                          password = value;
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password please";
                          }
                          return null;
                        },
                        cursorColor: AppColors.color86D,
                        decoration: InputDecoration(
                          labelText: AppTexts.yourPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              togglePasswordVisibility();
                            },
                            icon: isPasswordVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColors.color86D,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColors.color86D,
                                  ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: confirmPasswordController,
                        onChanged: (value) => setState(() {
                          confirmPassword = value;
                        }),
                        obscureText: !isConfirmPasswordVisible,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Confirm password";
                          } else {
                            return validateConfirmPassword(value);
                          }
                          // return null;
                        },
                        cursorColor: AppColors.color86D,
                        decoration: InputDecoration(
                          labelText: AppTexts.confirmPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleConfirmPasswordVisibility();
                            },
                            icon: isConfirmPasswordVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColors.color86D,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColors.color86D,
                                  ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      SizedBox(height: 20.h),
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
                          if (formKey.currentState!.validate()) {
                            signUpUser(
                                emailController.text, passwordController.text);
                          }
                        },
                        child: Text(
                          AppTexts.createAccount,
                          style: GoogleFonts.cabin(
                            color: email.isEmpty && password.isEmpty
                                ? AppColors.colorC7B
                                : AppColors.colorFFF,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      weight: 20.w,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
