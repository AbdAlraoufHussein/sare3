import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/view/screen/main_page/cart_page.dart';
import 'package:wael/view/screen/main_page/categories_page.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/screen/main_page/profile_page.dart';

class BottomNavController extends GetxController {
  static const pages = [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    ProfilePage(),
  ];

  final selectedIndex = 0.obs;

  Widget get currentPage => pages[selectedIndex.value];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
