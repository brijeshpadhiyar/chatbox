import 'package:chatbox/constant/text_styles.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:chatbox/controller/authentication/signup/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.colorFFF,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(
                      () => Form(
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
                                  controller: controller.nameController.value,
                                  onChanged: (value) => controller.name.value = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Name please";
                                    }
                                    return null;
                                  },
                                  cursorColor: AppColors.color86D,
                                  decoration: InputDecoration(
                                    labelText: AppTexts.yourName,
                                    suffixIcon: controller.name.isNotEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              controller.nameController.value.clear();
                                              controller.name.value = '';
                                            },
                                            icon: const Icon(Icons.close_sharp))
                                        : null,
                                    enabledBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                                    focusedBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                                    labelStyle: textButtonLabelStyle(),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormField(
                                  controller: controller.emailController.value,
                                  onChanged: (value) => controller.email.value = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter email";
                                    }
                                    var error = controller.validateEmail(value);
                                    return error;
                                  },
                                  cursorColor: AppColors.color86D,
                                  decoration: InputDecoration(
                                    labelText: AppTexts.yourEmail,
                                    suffixIcon: controller.email.isNotEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              controller.emailController.value.clear();
                                              controller.email.value = '';
                                            },
                                            icon: const Icon(Icons.close_sharp))
                                        : null,
                                    enabledBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                                    focusedBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                                    labelStyle: textButtonLabelStyle(),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormField(
                                  controller: controller.passwordController.value,
                                  obscureText: !controller.isPasswordVisible.value,
                                  obscuringCharacter: '*',
                                  onChanged: (value) => controller.password.value = value,
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
                                        controller.togglePasswordVisibility();
                                      },
                                      icon: controller.isPasswordVisible.value
                                          ? Icon(
                                              Icons.visibility,
                                              color: AppColors.color86D,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: AppColors.color86D,
                                            ),
                                    ),
                                    enabledBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                                    focusedBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                                    labelStyle: textButtonLabelStyle(),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextFormField(
                                  controller: controller.confirmPasswordController.value,
                                  onChanged: (value) => controller.confirmPassword.value = value,
                                  obscureText: !controller.isConfirmPasswordVisible.value,
                                  obscuringCharacter: '*',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please Confirm password";
                                    }
                                    return controller.validateConfirmPassword(value);
                                  },
                                  cursorColor: AppColors.color86D,
                                  decoration: InputDecoration(
                                    labelText: AppTexts.confirmPassword,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.toggleConfirmPasswordVisibility();
                                      },
                                      icon: controller.isConfirmPasswordVisible.value
                                          ? Icon(
                                              Icons.visibility,
                                              color: AppColors.color86D,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: AppColors.color86D,
                                            ),
                                    ),
                                    enabledBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                                    focusedBorder:
                                        UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                                    labelStyle: textButtonLabelStyle(),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.email.value.isEmpty && controller.password.value.isEmpty
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
                                      controller.signUpUser(controller.emailController.value.text,
                                          controller.passwordController.value.text);
                                    }
                                  },
                                  child: Text(
                                    AppTexts.createAccount,
                                    style: GoogleFonts.cabin(
                                      color: controller.email.value.isEmpty && controller.password.value.isEmpty
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
                              onTap: () => Get.back(),
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
              ));
        });
  }
}
