import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeIcon extends StatelessWidget {
  final String imagePath;
  final Color? imageColor;
  final Color borderColor;
  const CustomeIcon({
    super.key,
    required this.imagePath,
    this.imageColor,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: Image.asset(
          color: imageColor,
          imagePath,
        ),
      ),
    );
  }
}
