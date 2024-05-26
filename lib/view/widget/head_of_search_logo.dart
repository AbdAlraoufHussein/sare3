import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/favorite_page.dart';

class HeadOfSearchLogo extends StatelessWidget {
  const HeadOfSearchLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 24, right: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/images/logo.png"),
                width: 58.w,
                height: 58.h,
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            height: 55.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
              ),
              border: Border(
                top: BorderSide(color: AppColor.blue, width: 2.w),
                bottom: BorderSide(color: AppColor.blue, width: 2.w),
                left: BorderSide(color: AppColor.blue, width: 2.w),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => const FavoratePage());
              },
              padding: const EdgeInsets.all(0),
              icon: Icon(
                Icons.favorite_rounded,
                color: AppColor.blue,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            height: 55.h,
            width: 219.w,
            child: TextField(
              onChanged: null,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Transform.scale(
                  scale: 0.3,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/search.png',
                    ),
                  ),
                ),
                hintText: ' search',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.blue,
                    width: 2.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  borderSide: BorderSide(
                    color: AppColor.blue,
                    width: 2.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
