import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class Brand extends StatelessWidget {
  const Brand(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.onTap});
  final String name;
  final String imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
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
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              textAlign: TextAlign.center,
              name,
              style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class BrandWithRightTitle extends StatelessWidget {
  const BrandWithRightTitle(
      {super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
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
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            textAlign: TextAlign.center,
            name,
            style: TextStyle(
                fontSize: 22.sp,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SkeletonizerBrandWithRightTitle extends StatelessWidget {
  const SkeletonizerBrandWithRightTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
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
                  child: Image.asset(
                    'assets/images/hfhfe.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            textAlign: TextAlign.center,
            'name',
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
