import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/helpers/stripe_helper.dart';

class BoxDetailsPayment extends StatelessWidget {
  const BoxDetailsPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
              border: Border(
                left: BorderSide(color: AppColor.blue, width: 3.w),
                right: BorderSide(color: AppColor.blue, width: 3.w),
                top: BorderSide(color: AppColor.blue, width: 3.w),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Cost: ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '. Before discount: ',
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '545,000 L.S',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColor.yellow,
                          color: AppColor.yellow,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '. After discount: ',
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '500,000 L.S',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 10.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius:  BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              side: BorderSide(
                                color: AppColor.yellow,
                                width: 3.w,
                              ),
                            ),
                          ),
                          onPressed: () {
                            StripeHelper.stripe();
                          },
                          child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              'Payment for reservation',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
     ;
  }
}