import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:wael/controller/splash_controller.dart';
import 'package:wael/core/constant/imageasset.dart';
import 'package:wael/core/constant/routes.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  static final SplashController _splashScreen = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          AppImageAsset.splashScreen,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}