import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/constant/routes.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    'Terms And Conditions',
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
              child: Text(
                'Terms and Conditions of Use Our Electronic Store Application :',
                style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: ListView(
                  children: [
                    Text(
                      '1. Introduction:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'By using the app, you agree to these terms and conditions.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '2. Right to Use:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'The app is for personal, non-commercial use only.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '3. Registration:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Accurate information must be provided when creating an account.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '4. Security:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Login information must be kept confidential.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '5. Lawful Use:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'The app may not be used for unlawful purposes.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '6. Intellectual Property Protection:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Intellectual property rights of the content must be respected.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '7. Liability:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'The app is not responsible for any improper use.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '8. Amendment of Terms:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'We reserve the right to modify terms without prior notice.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '9. Transactions:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Transactions are governed by the specified policy.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '10. Disputes:',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Disputes are subject to local jurisdiction.',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
