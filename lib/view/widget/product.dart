import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/product_page.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 13.w),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    
                  ),
                  color: AppColor.red,
                ),
                height: 156.h,
                width: 155.w,
              ),
              InkWell(
                onTap: () {
                  Get.to(const ProductPage());
                },
                child: SizedBox(
                  height: 156.h,
                  width: 155.3.w,
                  child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(14.r),
                      topRight: Radius.circular(14.r),

                      bottomRight: Radius.circular(95.r),
                    ),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/images/product_image_hfhfe.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 130.h, left: 120.w),
                child: Text(
                  '30%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 156.h),
                child: Container(
                  height: 100.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    color: AppColor.greyfateh,
                    borderRadius:  BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 128.h, left: 55.w),
                child: Image.asset(
                  'assets/images/product_btn_addtocart.png',
                  height: 42.h,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(
                  top: 175.h,
                  left: 8.w,
                ),
                child: Text(
                  'Hfhfe shampoo',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 218.h, left: 118.w),
                child: Image.asset(
                  'assets/images/product_favorate.png',
                  height: 30.h,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 210.h, left: 8.w),
                child: Text(
                  '500,000 L.S',
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 230.h, left: 8.w),
                child: Text(
                  '545,000 L.S',
                  style: TextStyle(
                    decorationColor: AppColor.yellow,
                    decoration: TextDecoration.lineThrough,
                    color: AppColor.yellow,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
