import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/data/datasourse/static/static.dart';

class SliderOnBoarding extends GetView<OnBoardingControolerEmplement> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) => {
        controller.pageChanged(val)
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
            height: 45.h,
          ),
          Container(
            height: 60.h,
            width: 290.w,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //write
                  onBoardingList[i].title!,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ],
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                onBoardingList[i].image!,
                height: 350.h,
                width: 350.w,
              ),
            ],
          ),
           SizedBox(
            height: 10.h,
          ),
          Container(
            width: 300.w,
            alignment: Alignment.center,
            child: Text(
              //write
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 2.h,
                  fontSize: 15.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
