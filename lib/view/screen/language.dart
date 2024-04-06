import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/localization/changelangauge.dart';
import 'package:wael/view/widget/language/btnlanguage.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'choose language'.tr,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            LangaugeBtn(
              text: 'Arabic'.tr,
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            LangaugeBtn(
              text: 'English'.tr,
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
