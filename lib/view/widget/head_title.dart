import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              'assets/images/btn_back.png',
              height: 15.h,
            ),
          ),
          SizedBox(
            width: 64.w,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.blue),
          ),
        ],
      ),
      Divider(color: AppColor.blue,thickness: 4,)
    ],
                  ),
                );
  }
}