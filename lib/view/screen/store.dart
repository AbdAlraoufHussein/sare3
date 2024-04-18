import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/product_with_big_discount.dart';
import 'package:wael/view/widget/store_page/followers.dart';
import 'package:wael/view/widget/store_page/image_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 25, top: 55, bottom: 10),
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
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                  ),
                  const SizedBox(
                    width: 170,
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
            Expanded(
                child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageStore(),
                      SizedBox(
                        width: 70,
                      ),
                      Followers(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        '. Category: Clothing ',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        '. Address: Damascus Branch / Mezzeh Project opposite Khaled Ibn Al-Walid Mosque',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        '. Telephone: 3156294',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        '. Phone: 0956265849',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        '. We guarantee that any product we sell can be exchanged up to three days from the date of receipt or the purchase date',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.yellow,
                            decorationThickness: 2,
                            fontSize: 22,
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MainPoints(text: 'New Products', widthspace: 110),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                      child: SingleChildScrollView(
                        // reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Product(),
                            Product(),
                            Product(),
                            Product(),
                            Product(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MainPoints(text: 'The Big Discounts', widthspace: 71),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                      child: SingleChildScrollView(
                        // reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductWithBigDiscount(),
                            ProductWithBigDiscount(),
                            ProductWithBigDiscount(),
                            ProductWithBigDiscount(),
                            ProductWithBigDiscount(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
