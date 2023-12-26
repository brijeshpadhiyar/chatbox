import 'package:chatbox/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    String type = 'info', // 'info', 'success', 'error'
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            maxLines: 1,
            style: GoogleFonts.roboto(
              fontSize: 18.sp,
              color: AppColors.color000,
            ),
          ),
          Text(
            message,
            style: GoogleFonts.roboto(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      backgroundColor:
          type == 'error' ? Colors.red.shade300 : Colors.grey.shade300,
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // You can add any action on close if needed
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
