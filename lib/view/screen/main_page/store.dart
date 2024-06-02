import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/models/category_model.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/screen/main_page/product_page.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/store_page/head_of_storepage.dart';
import 'package:wael/view/widget/store_page/information_of_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key, required this.brandId});
  final int brandId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: Scaffold(
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
                              return const Skeletonizer(
                                  child: SkeletonizerCategoryInfo());
                            }
                            final brandData = snapshot.data!.singleWhere(
                                (element) => element.id == brandId);
                            final categories = brandData.categories
                                .map((e) => CategoryModel.fromJson(e).name)
                                .toList();
                            return CategoryInfo(
                              image: brandData.image,
                              name: brandData.name,
                              categories: categories,
                              address: brandData.address,
                              telephone: brandData.telephone,
                              phone: brandData.phone,
                              description: brandData.description,
                              brandId: brandData.id,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: BlocBuilder<ProductCubit, ProductState>(
                            bloc: ProductCubit()
                              ..getProducts(),
                            builder: (context, state) {
                              if (state is ProductFetched) {
                                final productData = state.productData;
                                return SizedBox(
                                  height: 270.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productData.length,
                                    itemBuilder: (context, index) {
                                      return Product(
                                        onProductTap: () {
                                          Get.to(() => ProductPage(
                                                product_id:
                                                    productData[index].id,
                                              ));
                                        },
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
                              } else if (state is ProductFailure) {
                                return Container(
                                  width: 200,
                                  height: 200,
                                  child: Text(state.errorMessage),
                                );
                              }
                              return SizedBox(
                                height: 270.h,
                                child: const SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Skeletonizer(
                                    enabled: true,
                                    child: Row(
                                      children: [
                                        SkeletonizerProduct(),
                                        SkeletonizerProduct(),
                                        SkeletonizerProduct(),
                                      ],
                                    ),
                                  ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: BlocBuilder<ProductCubit, ProductState>(
                                bloc: ProductCubit()
                                  ..getBiggestDiscountProduct(),
                                builder: (context, state) {
                                  if (state is ProductFetched) {
                                    final productData = state.productData;
                                    return SizedBox(
                                      height: 270.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: productData.length,
                                        itemBuilder: (context, index) {
                                          return Product(
                                            onProductTap: () {
                                              Get.to(() => ProductPage(
                                                    product_id:
                                                        productData[index].id,
                                                  ));
                                            },
                                            onChange: (isFavorite) {
                                              productData[index]
                                                      .is_favorite_for_current_user =
                                                  isFavorite;
                                            },
                                            isFavorite: productData[index]
                                                .is_favorite_for_current_user,
                                            product_id: productData[index].id,
                                            discountPercentage:
                                                productData[index]
                                                    .discount_percentage,
                                            discountPrice:
                                                productData[index].sale_price,
                                            image: productData[index].image,
                                            name: productData[index].name,
                                            realPrice: productData[index]
                                                .regular_price,
                                          );
                                        },
                                      ),
                                    );
                                  } else if (state is ProductFailure) {
                                    return Container(
                                      width: 200,
                                      height: 200,
                                      child: Text(state.errorMessage),
                                    );
                                  }
                                  return SizedBox(
                                    height: 270.h,
                                    child: const SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Skeletonizer(
                                        enabled: true,
                                        child: Row(
                                          children: [
                                            SkeletonizerProduct(),
                                            SkeletonizerProduct(),
                                            SkeletonizerProduct(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
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
      ),
    );
  }
}
