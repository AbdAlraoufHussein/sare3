import 'package:flutter/material.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/product_with_big_discount.dart';
import 'package:wael/view/widget/store_page/head_of_storepage.dart';
import 'package:wael/view/widget/store_page/image_store.dart';
import 'package:wael/view/widget/store_page/information_of_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const HeadOfStorePage(),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageStore(),
                        SizedBox(
                          width: 70,
                        ),
                        // Followers(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InformationOfStore(),
                      const SizedBox(
                        height: 20,
                      ),
                      MainPoints(
                        text: 'New Products',
                        widthspace: 110,
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8),
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
                      MainPoints(
                        text: 'The Big Discounts',
                        widthspace: 71,
                        onTap: () {},
                      ),
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
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
