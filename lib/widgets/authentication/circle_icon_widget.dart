import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customeCircleIcon(String imagePath) {
  return Container(
    width: 48.w,
    height: 48.h,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        )),
    child: Center(
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}
