import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/store_page/head_of_storepage.dart';
import 'package:wael/view/widget/store_page/information_of_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key, required this.brandId});
  final int brandId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadOfStorePage(),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                        future: BrandService.getAllBrands(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const SkeletonizerCategoryInfo();
                          }
                          final brandData = snapshot.data!
                              .singleWhere((element) => element.id == brandId);
                          return CategoryInfo(
                            image: brandData.image,
                            name: brandData.name,
                            categories: brandData.categories,
                            address: brandData.address,
                            telephone: brandData.telephone,
                            phone: brandData.phone,
                            description: brandData.description,
                          );
                        },
                      ),
                      Center(
                        child: Text(
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
                      ),
                      MainPoints(text: 'New Products', onTap: () {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FutureBuilder(
                          future: ProductServices.getAllProducts(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return SizedBox(
                                height: 261.h,
                                child: const SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Skeletonizer(
                                    enabled: true,
                                    child: Row(
                                      children: [
                                        SkeletonizerProduct(),
                                        SkeletonizerProduct(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            final productData = snapshot.data!;
                            return SizedBox(
                              height: 261.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: productData.length,
                                itemBuilder: (context, index) {
                                  return Product(
                                    onChange: (isFavorite) {
                                      productData[index]
                                              .is_favorite_for_current_user =
                                          isFavorite;
                                    },
                                    isFavorite: productData[index]
                                        .is_favorite_for_current_user,
                                    product_id: productData[index].id,
                                    discountPercentage:
                                        productData[index].discount_percentage,
                                    discountPrice:
                                        productData[index].sale_price,
                                    image: productData[index].image,
                                    name: productData[index].name,
                                    realPrice: productData[index].regular_price,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          MainPoints(
                            text: 'The Big Discounts',
                            onTap: () {},
                          ),
                          FutureBuilder(
                            future: ProductServices.getAllProducts(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Skeletonizer(
                                  child: SizedBox(
                                    height: 261.h,
                                    child: const SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SkeletonizerProduct(),
                                          SkeletonizerProduct(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final productData = snapshot.data!
                                  .where((element) =>
                                      element.discount_percentage <=
                                      element.regular_price * 50 / 100)
                                  .toList();
                              if (productData == []) {
                                return Text('Soon');
                              }
                              return SizedBox(
                                height: 261.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productData.length,
                                  itemBuilder: (context, index) {
                                    return Product(
                                      onChange: (isFavorite) {
                                        productData[index]
                                                .is_favorite_for_current_user =
                                            isFavorite;
                                      },
                                      isFavorite: productData[index]
                                          .is_favorite_for_current_user,
                                      product_id: productData[index].id,
                                      discountPercentage: productData[index]
                                          .discount_percentage,
                                      discountPrice:
                                          productData[index].sale_price,
                                      image: productData[index].image,
                                      name: productData[index].name,
                                      realPrice:
                                          productData[index].regular_price,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
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
