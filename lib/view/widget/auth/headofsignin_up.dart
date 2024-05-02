import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class HeadOfSignInUp extends StatelessWidget {
  const HeadOfSignInUp({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 50.h,
        ),
        Text(
          text,
          style:  TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.blue,
          ),
          textAlign: TextAlign.center,
        ),
         SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
