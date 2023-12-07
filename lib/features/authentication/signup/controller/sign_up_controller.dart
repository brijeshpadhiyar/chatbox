import 'package:chatbox/features/authentication/signup/service/signup_service.dart';
import 'package:chatbox/widgets/errorShow/custome_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final service = Get.put(SignUpService());

  final nameController = Rx(TextEditingController());
  final emailController = Rx(TextEditingController());
  final passwordController = Rx(TextEditingController());
  final confirmPasswordController = Rx(TextEditingController());

  final name = Rx<String>('');
  final email = Rx<String>('');
  final password = Rx<String>('');
  final confirmPassword = Rx<String>('');
  final isPasswordVisible = Rx<bool>(false);
  final isConfirmPasswordVisible = Rx<bool>(false);

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != password.value) {
      return "Passwords do not match";
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> signUpUser(String email, String password) async {
    final message = await service.signUpUser(email, password);
    if (message == null) {
      CustomeSnackbar.show(title: 'Success', message: 'Sign up successful');
    } else {
      CustomeSnackbar.show(title: 'Error', message: message);
    }
  }
}
