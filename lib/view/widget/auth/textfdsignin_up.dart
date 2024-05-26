import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextFdSignInUp extends StatelessWidget {
  const TextFdSignInUp({
    super.key,
    required this.texthint,
    required this.keyboardType,
    required this.textlabel,
    this.onChanged,
    required this.validator,
    required this.controller,
  });
  final String texthint;
  final String textlabel;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          // prefixText: texthintprefix,
          // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintText: texthint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
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
