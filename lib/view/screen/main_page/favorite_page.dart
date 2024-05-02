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
                children: const[
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                  ProductFavorite(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
