import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/constant/routes.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offNamed(AppRoute.mainPage);
                    },
                    icon: Image.asset(
                      'assets/images/btn_back.png',
                      height: 15.h,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blue),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 40.h,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Details :',
                    style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/whatsapp.png',
                        width: 45,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Text(
                        '+963 968 645 606',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/gmail.png',
                        width: 45,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Text(
                        'sare3.store@gmail.com',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        width: 45,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Text(
                        'Sare3 Store',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/instagram.png',
                        width: 45,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Text(
                        'sare3_store81',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
