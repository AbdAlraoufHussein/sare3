import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/banner_service.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/view/screen/main_page/categories_page.dart';
import 'package:wael/view/screen/main_page/product_page.dart';
import 'package:wael/view/screen/main_page/products_page.dart';
import 'package:wael/view/screen/main_page/store.dart';
import 'package:wael/view/widget/head_of_search_logo.dart';
import 'package:wael/view/widget/home_page/brand.dart';
import 'package:wael/view/widget/home_page/carosel_slider.dart';
import 'package:wael/view/widget/home_page/show_all_brands.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/product_page/favorite_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                const HeadOfSearchLogo(),
                FutureBuilder(
                  future: BannerService().getAllBanners(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Skeletonizer(
                        enabled: true,
                        child: SkeletonizerCaroselSlider(),
                      );
                    }
                    final bannerData = snapshot.data!;
                    return CaroselSlider(
                      carosellImages: bannerData.map((e) => e.image).toList(),
                      itemCount: bannerData.length,
                    );
                  },
                ),
                MainPoints(
                    text: 'Brands',
                    onTap: () {
                      Get.to(() => const AllBrands());
                    }),
                FutureBuilder(
                  future: BrandService.getAllBrands(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Skeletonizer(
                          enabled: true,
                          child: Row(
                            children: [
                              SkeletonizerBrand(),
                              SkeletonizerBrand(),
                              SkeletonizerBrand(),
                              SkeletonizerBrand(),
                            ],
                          ),
                        ),
                      );
                    }
                    final brandData = snapshot.data!;
                    return SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: brandData.length,
                        itemBuilder: (context, index) {
                          return Brand(
                            onTap: () {
                              Get.to(() =>
                                  StorePage(brandId: brandData[index].id));
                            },
                            imageUrl: brandData[index].image,
                            name: brandData[index].name,
                          );
                        },
                      ),
                    );
                  },
                ),
                MainPoints(
                    text: 'New Products',
                    onTap: () {
                      Get.to(() => const ProductsPage());
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BlocBuilder<ProductCubit, ProductState>(
                    bloc: ProductCubit()..getProducts(),
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
                                        product_id: productData[index].id,
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
                                    productData[index].discount_percentage,
                                discountPrice: productData[index].sale_price,
                                image: productData[index].image,
                                name: productData[index].name,
                                realPrice: productData[index].regular_price,
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
          ),
        ),
      ),
    );
  }
}

class SkeletonizerProduct extends StatelessWidget {
  const SkeletonizerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 155.w,
      decoration: BoxDecoration(
          color: AppColor.greyfateh, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  color: AppColor.red,
                ),
                height: 156.h,
                width: 155.w,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 156.h,
                  width: 155.3.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                      bottomRight: Radius.circular(95.r),
                    ),
                    child: Image.asset(
                      'assets/images/carosel2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  '50%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 24, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'L.S',
                          style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'L.S',
                          style: TextStyle(
                            decorationColor: AppColor.yellow,
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.yellow,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    FavoriteButton(
                      isFavorite: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
