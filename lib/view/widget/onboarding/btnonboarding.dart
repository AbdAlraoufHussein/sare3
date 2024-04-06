import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/color.dart';

class OnBoardingBtn extends GetView<OnBoardingControolerEmplement> {
  const OnBoardingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            side: BorderSide(
              color: AppColor.blue,
              width: 3,
            ),
          ),
        ),
        onPressed: () {
          controller.next();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
          child: Text(
            '10'.tr,
            style: TextStyle(
              fontSize: 18,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
