import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/core/constant/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(
      Duration(seconds: 3),
    );

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final userId = sharedPreferences.getInt('userId');

    if (userId != null) {
      Get.toNamed(AppRoute.mainPage);
    } else {
      Get.toNamed(AppRoute.onBoarding);
    }
  }
}
