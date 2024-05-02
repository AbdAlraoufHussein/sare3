import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class TextFdPassSignInUp extends StatelessWidget {
  const TextFdPassSignInUp({
    super.key,
    required this.texthint,
    required this.txetlabel,
    required this.onChanged,
  });
  final String texthint;
  final String txetlabel;

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 310.w,
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: texthint,
          hintStyle:  TextStyle(color: Colors.grey, fontSize: 14.sp),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Image(
              image:const  AssetImage(
                'assets/images/eye.png',
              ),
              height: 14.h,
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
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
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
