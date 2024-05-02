import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class BtnSignInUp extends StatelessWidget {
  const BtnSignInUp({super.key, required this.txet, required this.onPressed});
  final String txet;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColor.blue,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
              side: BorderSide(
                color:AppColor.blue,
                width: 3.w,
              )),
        ),
        onPressed:onPressed,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 60.w, vertical: 12.h),
          child: Text(
            txet,
            style:  TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
