import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/store.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const StorePage());
            },
            child: Container(
              padding: const EdgeInsets.all(3), // Border width
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(30), // Image radius
                  child: Image.asset("assets/images/hfhfe.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "hfhfe",
              style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
