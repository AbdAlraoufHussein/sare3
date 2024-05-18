import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextFdSignInUp extends StatelessWidget {
  const TextFdSignInUp({
    super.key,
    required this.texthint,
    required this.keyboardType,
    required this.textlabel,
    required this.onChanged,
    required this.validator,
  });
  final String texthint;
  final String textlabel;
  final String? Function(String? value)? validator;
  final void Function(String) onChanged;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 310.w,
      child: TextFormField(
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
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
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
