import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextBtnSugnInUp extends StatelessWidget {
  const TextBtnSugnInUp(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 190.w),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15.sp,
              color: AppColor.blue,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
