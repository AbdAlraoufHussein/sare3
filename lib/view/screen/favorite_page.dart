import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/favorite_page/product_favorite.dart';

class FavoratePage extends StatelessWidget {
  const FavoratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      'Favorites List',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                children: [
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                  salad(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class salad extends StatelessWidget {
  const salad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      decoration: BoxDecoration(
          color: AppColor.greyfateh, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 130,
                width: 140,
                decoration: BoxDecoration(
                    color: AppColor.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
              ),
              Container(
                height: 130,
                width: 140,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Image.asset(
                    width: 142.5,
                    'assets/images/product_image_bijama.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(bottom: 5, right: 5, child: Text('30 %')),
              Positioned(
                right: -30,
                top: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/product_btn_addtocart.png',
                    height: 45,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cotton Pajamas',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  '500,000 L.S',
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '545,000 L.S',
                  style: TextStyle(
                    decorationColor: AppColor.yellow,
                    decoration: TextDecoration.lineThrough,
                    color: AppColor.yellow,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/delete.png',
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
