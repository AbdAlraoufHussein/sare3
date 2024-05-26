import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/view/widget/favorite_page/product_favorite.dart';

class FavoratePage extends StatelessWidget {
  const FavoratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      'assets/images/btn_back.png',
                      height: 15.h,
                    ),
                  ),
                  SizedBox(
                    width: 60.h,
                  ),
                  Text(
                    'Favorites List',
                    style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            FutureBuilder(
              future: ProductServices().getFavoriteProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return ProductFavorite(
                    onChange: (isFavorite) {},
                    product_id: 1,
                  );
                final favProducts = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: favProducts.length,
                    itemBuilder: (context, index) {
                      return ProductFavorite(
                        onChange: (isFavorite) {
                          favProducts[index].is_favorite_for_current_user =
                              isFavorite;
                        },
                        product_id: favProducts[index].id,
                        isFavorite:
                            favProducts[index].is_favorite_for_current_user,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
