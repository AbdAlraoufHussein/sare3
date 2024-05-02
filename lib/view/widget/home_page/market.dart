import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/store.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const StorePage());
            },
            child: Container(
              padding:  EdgeInsets.all(3.r), // Border width
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius:  BorderRadius.all(
                  Radius.circular(5.r),
                ),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(
                  Radius.circular(5.r),
                ),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(30.r), // Image radius
                  child: Image.asset("assets/images/hfhfe.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.h),
            child: Text(
              "hfhfe",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
