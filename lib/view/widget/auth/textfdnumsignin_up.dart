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
  });
  final String textprefix;
  final String textlabel;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 310.w,
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          // prefixText: textprefix,
          // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          hintText: textprefix,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
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
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
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
