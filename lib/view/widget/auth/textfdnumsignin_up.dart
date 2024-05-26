import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextFdNumSignInUp extends StatelessWidget {
  const TextFdNumSignInUp({
    super.key,
    required this.textprefix,
    required this.keyboardType,
    required this.textlabel,
    required this.validator,
    required this.controller,
  });
  final String textprefix;
  final String textlabel;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          // prefixText: textprefix,
          // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          hintText: textprefix,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            borderSide: BorderSide(
              color: AppColor.blue,
              width: 2.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            borderSide: BorderSide(
              color: AppColor.blue,
              width: 2.w,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          label: Text(textlabel),
          labelStyle: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.blue,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.blue,
              width: 3.w,
            ),
          ),
        ),
      ),
    );
  }
}
