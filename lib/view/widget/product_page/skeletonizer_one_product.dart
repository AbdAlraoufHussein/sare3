import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/constant/color.dart';

class SkeletonizerOneProduct extends StatelessWidget {
  const SkeletonizerOneProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeletonizer(
          child: Column(
            children: [
             Padding(
      padding: EdgeInsets.symmetric(horizontal: 25..w, vertical: 5.h),
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
                      'assets/images/carosel2.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColor.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                '50 %',
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Description: ',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'description',
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4,
                      color: AppColor.blue,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sale price: ',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'realPrice'.toString(),
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Discount price: ',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'discountPrice'.toString(),
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  side: BorderSide(
                    color: AppColor.yellow,
                    width: 3,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
