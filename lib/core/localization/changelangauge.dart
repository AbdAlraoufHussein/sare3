import 'dart:ui';

import 'package:get/get.dart';
import 'package:wael/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? langauge;

  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      langauge = const Locale('ar');
    } else if (sharedPrefLang == 'en') {
      langauge = const Locale('en');
    } else {
      langauge = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
