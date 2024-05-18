import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/class/base_api_class.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/store.dart';

class Brand extends StatelessWidget {
  const Brand({super.key, this.name, this.imageUrl});

  final String? name;

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const StorePage());
            },
            child: Container(
              padding: EdgeInsets.all(3.r), // Border width
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(30.r), // Image radius
                  child: imageUrl != null
                      ? Image.network(BaseApi.domain + imageUrl!)
                      : Image.asset("assets/images/hfhfe.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              name ?? "hfhfe",
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
