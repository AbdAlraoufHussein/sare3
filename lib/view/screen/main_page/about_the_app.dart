import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/constant/routes.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

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
                    'About The Application',
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

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'About Sare3 App :',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Welcome to Sare3, your next-generation e-commerce platform. At Sare3, we connect consumers with a vast selection of products, from household essentials to the latest tech gadgets. Every feature on our app is designed with your convenience in mind, offering an intuitive shopping experience that is both secure and user-friendly. With real-time tracking, a wide range of payment options, and dedicated customer support, Sare3 is committed to redefining the way you shop online.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Features of Sare3 :',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '- User-friendly interface\n- Diverse product categories\n- Secure payment systems\n- Fast and reliable shipping options\n- Responsive customer service',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      'Join the Sare3 community today and enjoy the ultimate online shopping journey!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decorationColor: AppColor.yellow,
                        color: AppColor.yellow,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
