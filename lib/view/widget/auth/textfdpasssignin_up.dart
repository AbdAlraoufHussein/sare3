import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextFdPassSignInUp extends StatelessWidget {
  const TextFdPassSignInUp({
    super.key,
    required this.texthint,
    required this.txetlabel,
    required this.onChanged,
    required this.validator,
    required this.isSecure, required this.suffixIcon,
  });
  final String texthint;
  final String txetlabel;
  final String? Function(String? value)? validator;
  final void Function(String) onChanged;
  final bool isSecure;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isSecure,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: texthint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
          suffixIcon: suffixIcon,
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
          label: Text(txetlabel),
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
