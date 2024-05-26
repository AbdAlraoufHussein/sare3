import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class MainPoints extends StatelessWidget {
  const MainPoints({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColor.blue),
          ),
          const Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'Show All',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: AppColor.blue,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  size: 20,
                  color: AppColor.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
