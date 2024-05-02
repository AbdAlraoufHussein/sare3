import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class RowProfile extends StatelessWidget {
  final String image;
  final String text;
  final double howfar;

  const RowProfile(
      {super.key,
      required this.image,
      required this.text,
      required this.howfar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.blue, width: 3.w),
      ),
      child: Row(
        children: [
           SizedBox(
            width: 15.w,
          ),
          Image.asset(
            '$image',
            height: 30.h,
          ),
           SizedBox(
            width: 15.w,
          ),
          Text(
            '$text',
            style: TextStyle(
                color: AppColor.blue,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: howfar,
          ),
          Image.asset(
            'assets/images/goarrow_image_profile.png',
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
