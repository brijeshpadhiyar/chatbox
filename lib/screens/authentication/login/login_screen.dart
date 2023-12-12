import 'package:chatbox/constant/colors.dart';
import 'package:chatbox/constant/text_styles.dart';
import 'package:chatbox/constant/texts.dart';
import 'package:chatbox/controller/authentication/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/images.dart';
import '../../../widgets/authentication/circle_icon_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GetBuilder<LoginController>(
      init: LoginController(),
      autoRemove: true,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => Form(
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
                        controller: controller.emailController.value,
                        onChanged: (value) => controller.email.value = value,
                        validator: (value) {
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
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      const Spacer(),
                      TextFormField(
                        controller: controller.passwordController.value,
                        onChanged: (value) => controller.password.value = value,
                        cursorColor: AppColors.color86D,
                        decoration: InputDecoration(
                          labelText: AppTexts.password,
                          suffixIcon: controller.password.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    controller.passwordController.value.clear();
                                    controller.password.value = '';
                                  },
                                  icon: const Icon(Icons.close_sharp))
                              : null,
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color1D0)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.color86D)),
                          labelStyle: textButtonLabelStyle(),
                        ),
                      ),
                      const Spacer(),
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
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          AppTexts.login,
                          style: GoogleFonts.cabin(
                            color: controller.email.value.isEmpty && controller.password.value.isEmpty
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
            ));
      },
    );
  }
}
