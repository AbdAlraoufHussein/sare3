import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class HeadOfProfilePage extends StatelessWidget {
  const HeadOfProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.h,
        ),
        Text(
          'Abd alraouf hussein',
          style: TextStyle(
              color: AppColor.blue,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '0968645606',
          style: TextStyle(
              color: AppColor.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 40.h,
          width: 150.w,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Edit your number',
              style: TextStyle(color: AppColor.white, fontSize: 13.sp),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  side: BorderSide(
                    color: AppColor.yellow,
                    width: 2.w,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          color: AppColor.yellow,
          thickness: 3.w,
        ),
      ],
    );
  }
}
