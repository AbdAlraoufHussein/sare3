import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/data/datasourse/static/static.dart';

class SliderOnBoarding extends GetView<OnBoardingControolerEmplement> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) => {
        controller.pageChanged(val)
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 60,
            width: 290,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //write
                  onBoardingList[i].title!,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                onBoardingList[i].image!,
                height: 350,
                width: 350,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Text(
              //write
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 2,
                  fontSize: 15,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
