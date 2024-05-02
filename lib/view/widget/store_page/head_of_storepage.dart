import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';

class HeadOfStorePage extends StatelessWidget {
  const HeadOfStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 25, top: 55, bottom: 10),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(
                    'assets/images/btn_back.png',
                    height: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 220,
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
