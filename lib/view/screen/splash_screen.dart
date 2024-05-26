import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/core/constant/imageasset.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    middleware();
    super.initState();
  }

  void middleware() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    if (token == null) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.to(const OnBoarding()));
    } else {
      Get.offNamed(AppRoute.mainPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            AppImageAsset.splashScreen,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
