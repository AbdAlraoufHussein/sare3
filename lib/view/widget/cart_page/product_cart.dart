import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class ProductOfCart extends StatelessWidget {
  const ProductOfCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColor.greyfateh,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 130.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                ),
              ),
              SizedBox(
                height: 130.h,
                width: 141.5.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(100.r),
                  ),
                  child: Image.asset(
                    width: 142.w,
                    'assets/images/product_image_bijama.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5.h,
                right: 3.w,
                child: Text(
                  '30%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cotton Pajamas',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '500,000 L.S',
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '545,000 L.S',
                  style: TextStyle(
                    decorationColor: AppColor.yellow,
                    decoration: TextDecoration.lineThrough,
                    color: AppColor.yellow,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 30.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.r),
                    ),
                    border: Border.all(color: AppColor.blue, width: 2.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.remove,
                          color: AppColor.blue,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.add,
                          color: AppColor.blue,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/delete.png',
                height: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
