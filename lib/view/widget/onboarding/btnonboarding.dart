import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/color.dart';

class OnBoardingBtn extends GetView<OnBoardingControolerEmplement> {
  const OnBoardingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 50.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.all(
              Radius.circular(5.r),
            ),
            side: BorderSide(
              color: AppColor.blue,
              width: 3.w,
            ),
          ),
        ),
        onPressed: () {
          controller.next();
        },
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 60.w, vertical: 12.h),
          child: Text(
            'Continue'.tr,
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
