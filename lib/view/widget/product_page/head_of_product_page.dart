import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';

class HeadOfProductPage extends StatelessWidget {
  const HeadOfProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                padding: const EdgeInsets.all(0),
                icon: Image.asset(
                  'assets/images/btn_back.png',
                  height: 15,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_rounded,
                  size: 25,
                ),
                color: AppColor.blue,
              ),
            ],
          ),
        ),
        Divider(
          color: AppColor.blue,
          thickness: 4, // سمك الخط
          indent: 30, // المسافة البادئة من الجانب الأيسر
          endIndent: 30, // المسافة الختامية من الجانب الأيمن
        ),
      ],
    );
  }
}
