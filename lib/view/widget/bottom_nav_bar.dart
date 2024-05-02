import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/bottom_nav_controller.dart';
import 'package:wael/core/constant/color.dart';

class BootomNavBar extends StatelessWidget {
  const BootomNavBar({super.key});

  static final BottomNavController controller = Get.find();
  static const bottomNavigationBarButtons = [
    {
      'icon': 'assets/images/navbar_icon_home.png',
      'active_icon': 'assets/images/navbar_icon_home_active.png',
      'text': 'Home',
    },
    {
      'icon': 'assets/images/navbar_icon_category.png',
      'active_icon': 'assets/images/navbar_icon_category_active.png',
      'text': 'Categories',
    },
    {
      'icon': 'assets/images/navbar_icon_cart.png',
      'active_icon': 'assets/images/navbar_icon_cart_active.png',
      'text': 'Cart',
    },
    {
      'icon': 'assets/images/navbar_icon_profile.png',
      'active_icon': 'assets/images/navbar_icon_profile_active.png',
      'text': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 6),
        //     blurRadius: 15,
        //     color: AppColor.blue,
        //   ),
        // ],
        color: AppColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(0),
        ),
        border: Border(
          top: BorderSide(color: AppColor.yellow, width: 3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            bottomNavigationBarButtons.length,
            (index) => InkWell(
              onTap: () => controller.changePage(index),
              child: Obx(
                () => Column(
                  children: [
                    Image.asset(
                      index == controller.selectedIndex.value
                          ? bottomNavigationBarButtons[index]['active_icon']!
                          : bottomNavigationBarButtons[index]['icon']!,
                      height: index == controller.selectedIndex.value ? 17 : 15,
                    ),
                    Text(
                      bottomNavigationBarButtons[index]['text']!,
                      style: TextStyle(
                        fontSize:
                            index == controller.selectedIndex.value ? 15 : 13,
                        fontWeight: FontWeight.w500,
                        color: index == controller.selectedIndex.value
                            ? AppColor.blue
                            : AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
