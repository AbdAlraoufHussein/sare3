import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/view/widget/onboarding/dotcontroller.dart';
import 'package:wael/view/widget/onboarding/btnonboarding.dart';
import 'package:wael/view/widget/onboarding/slideronboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControolerEmplement());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotControllerOnBoarding(),
                SizedBox(
                  height: 80,
                ),
                OnBoardingBtn(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
