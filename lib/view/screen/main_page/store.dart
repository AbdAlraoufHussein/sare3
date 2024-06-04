import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/brand_with_products/brand_with_products_cubit.dart';
import 'package:wael/core/constant/color.dart';
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
      create: (context) => BrandWithProductsCubit(),
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
                        BlocBuilder(
                            bloc: BrandWithProductsCubit()
                              ..getBrandWithProducts(brandId: brandId),
                            builder: (context, state) {
                              if (state is BrandWithProductsFetched) {
                                final brandData = state.brandWithProduct;
                                return CategoryInfo(
                                  image: brandData.image,
                                  name: brandData.name,
                                  categories: brandData.categories,
                                  address: brandData.address,
                                  telephone: brandData.telephone,
                                  phone: brandData.phone,
                                  description: brandData.description,
                                  brandId: brandData.id,
                                );
                              } else if (state is BrandWithProductsFailure) {
                                return Container(
                                  width: 200,
                                  height: 200,
                                  color: AppColor.blue,
                                  child: Text(state.errorMessage),
                                );
                              } else {
                                return const Skeletonizer(
                                    child: SkeletonizerCategoryInfo());
                              }
                            }),
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
                          child: BlocBuilder<BrandWithProductsCubit,
                              BrandWithProductsState>(
                            bloc: BrandWithProductsCubit()
                              ..getBrandWithProducts(brandId: brandId),
                            builder: (context, state) {
                              if (state is BrandWithProductsFetched) {
                                final productData =
                                    state.brandWithProduct.products;
                                return SizedBox(
                                  height: 270.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productData.length,
                                    itemBuilder: (context, index) {
                                      return Product(
                                        onProductTap: () {
                                          Get.to(() => ProductPage(
                                                productId:
                                                    productData[index].id,
                                              ));
                                        },
                                        onChange: (isFavorite) {
                                          productData[index]
                                                  .isFavoriteForCurrentUser =
                                              isFavorite;
                                        },
                                        isFavorite: productData[index]
                                            .isFavoriteForCurrentUser,
                                        product_id: productData[index].id,
                                        discountPercentage: productData[index]
                                            .discountPercentage,
                                        discountPrice:
                                            productData[index].salePrice,
                                        image: productData[index].image,
                                        name: productData[index].name,
                                        realPrice:
                                            productData[index].regularPrice,
                                      );
                                    },
                                  ),
                                );
                              } else if (state is BrandWithProductsFailure) {
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
                              child: BlocBuilder<BrandWithProductsCubit,
                                  BrandWithProductsState>(
                                bloc: BrandWithProductsCubit()
                                  ..getBrandWithProducts(brandId: brandId),
                                builder: (context, state) {
                                  if (state is BrandWithProductsFetched) {
                                    final productData =
                                        state.brandWithProduct.products.where(
                                      (element) =>
                                          element.discountPercentage >= 50,
                                    ).toList();
                                    return SizedBox(
                                      height: 270.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: productData.length,
                                        itemBuilder: (context, index) {
                                          return Product(
                                            onProductTap: () {
                                              Get.to(() => ProductPage(
                                                    productId:
                                                        productData[index].id,
                                                  ));
                                            },
                                            onChange: (isFavorite) {
                                              productData[index].
                                                      isFavoriteForCurrentUser =
                                                  isFavorite;
                                            },
                                            isFavorite: productData[index]
                                                .isFavoriteForCurrentUser,
                                            product_id: productData[index].id,
                                            discountPercentage:
                                                productData[index]
                                                    .discountPercentage,
                                            discountPrice:
                                                productData[index].salePrice,
                                            image: productData[index].image,
                                            name: productData[index].name,
                                            realPrice: productData[index]
                                                .regularPrice,
                                          );
                                        },
                                      ),
                                    );
                                  } else if (state is BrandWithProductsFailure) {
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
//  return const Skeletonizer(
//                                   child: SkeletonizerCategoryInfo());
//                             }
//                             final brandData = snapshot.data!.singleWhere(
//                                 (element) => element.id == brandId);
//                             final categories = brandData.categories
//                                 .map((e) => CategoryModel.fromJson(e).name)
//                                 .toList();
//                             return CategoryInfo(
//                               image: brandData.image,
//                               name: brandData.name,
//                               categories: categories,
//                               address: brandData.address,
//                               telephone: brandData.telephone,
//                               phone: brandData.phone,
//                               description: brandData.description,
//                               brandId: brandData.id,
//                             );