import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/bottom_nav_controller.dart';
import 'package:wael/view/widget/home_page/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String id = 'MainPage';

  static final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BootomNavBar(),
        body: Obx(() => controller.currentPage),
      ),
    );
  }
}
