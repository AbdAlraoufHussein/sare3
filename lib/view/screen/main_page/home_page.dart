import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/product/product_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/banner_service.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/view/screen/main_page/categories_page.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductCubit, ProductState>(
              bloc: ProductCubit(),
              builder: (context, state) {
                if (state is ProductFetched) {
                  final productData = state.productData;
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: productData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.network(productData[index].image),
                              Text('Name: ${productData[index].name}'),
                              Text(
                                  'Description: ${productData[index].description}'),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ProductFailure) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                    child: Text(state.errorMessage),
                  );
                } else {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                }
              },
            )
          ],
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
              Positioned(
                right: 0,
                left: 0,
                bottom: -20,
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/product_btn_addtocart.png',
                    height: 42.h,
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
