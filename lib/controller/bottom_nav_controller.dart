import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/view/screen/cart_page.dart';
import 'package:wael/view/screen/categories_page.dart';
import 'package:wael/view/screen/home_page.dart';
import 'package:wael/view/screen/profile_page.dart';

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
