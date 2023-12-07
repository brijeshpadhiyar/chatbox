import 'package:chatbox/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomeSnackbar {
  static void show({
    required String title,
    required String message,
  }) {
    Get.snackbar('', '',
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        icon: title.toLowerCase() == "error"
            ? const Icon(Icons.error)
            : title.toLowerCase() == "success"
                ? const Icon(Icons.done_all)
                : null,
        borderRadius: 20,
        titleText: Text(
          title,
          style: TextStyle(
            color: AppColors.color000,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          message,
          style: TextStyle(
            color: AppColors.color86D,
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        barBlur: 20,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        maxWidth: 350.w,
        padding: const EdgeInsets.all(10));
  }
}
