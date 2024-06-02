import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/core/constant/color.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    width: 64.w,
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
            BlocBuilder<ProductCubit, ProductState>(
              bloc: ProductCubit()..getFavoriteProduct(),
              builder: (context, state) {
                if (state is ProductFetched) {
                  final favProducts = state.productData;
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
                          discountPercentage:
                              favProducts[index].discount_percentage,
                          discountPrice: favProducts[index].sale_price,
                          image: favProducts[index].image,
                          name: favProducts[index].name,
                          realPrice: favProducts[index].regular_price,
                        );
                      },
                    ),
                  );
                } else if (state is ProductFailure) {
                  return Container(
                    height: 200,
                    width: 200,
                    child: Text(state.errorMessage),
                    color: Colors.amber,
                  );
                } else {
                  return const Skeletonizer(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SkeletonizerFavoriteProduct(),
                      ],
                    ),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
