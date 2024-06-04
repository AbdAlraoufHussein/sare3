import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wael/core/constant/color.dart';

class HeadOfStorePage extends StatelessWidget {
  const HeadOfStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  'assets/images/btn_back.png',
                  height: 15,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () async{
                  await Share.share('https://www.youtube.com');
                },
                icon: const Icon(
                  Icons.share_rounded,
                  size: 25,
                ),
                color: AppColor.blue,
              ),
              const SizedBox(
                width: 16,
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

class HeadOfProductPage extends StatelessWidget {
  const HeadOfProductPage({super.key, required this.product});
  final String product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  'assets/images/btn_back.png',
                  height: 15,
                ),
              ),
              Text(product),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_rounded,
                  size: 25,
                ),
                color: AppColor.blue,
              ),
              const SizedBox(
                width: 16,
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
