import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25..w, vertical: 5.h),
      child: Stack(
        children: [
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              child: Image.asset(
                'assets/images/product_image_hfhfe.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: Container(
              height: 40.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColor.red,
                borderRadius:  BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
                child: Text(
                  '30%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10.w,
            bottom: 10.h,
            child: Image.asset(
              'assets/images/product_favorate.png',
              height: 42.h,
            ),
          ),
        ],
      ),
    );
  }
}
