import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/data/datasourse/static/static.dart';

abstract class OnBoardingCOntroller extends GetxController {
  next();
  //للتفاعل عند النقاط
  pageChanged(int index);
}

class OnBoardingControolerEmplement extends OnBoardingCOntroller {
  late PageController pageController;

  int currenIndexPage = 0;

  @override
  next() {
    currenIndexPage++;
    if (currenIndexPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.signIn);
    } else {
      pageController.animateToPage(currenIndexPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  pageChanged(int index) {
    currenIndexPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
