import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class LogoutProfilePage extends StatelessWidget {
  const LogoutProfilePage({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColor.yellow, width: 3.w),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15.w,
            ),
            Icon(
              Icons.logout_rounded,
              color: AppColor.red,
              size: 28,
            ),
            SizedBox(
              width: 18.w,
            ),
            Text(
              'Logout',
              style: TextStyle(
                color: AppColor.red,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
