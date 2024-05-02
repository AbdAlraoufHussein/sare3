import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyofSignIn extends StatelessWidget {
  const BodyofSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'If you want to create a page for your own store, contact us : 0968645606'
                .tr,
            style: const TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          'assets/images/login.png',
          height: 150.h,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
