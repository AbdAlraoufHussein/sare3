import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/controller/cubits/get_cart/get_cart_cubit.dart';
import 'package:wael/controller/cubits/get_one_product/one_product_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/home_page/brand.dart';
import 'package:wael/view/widget/product_page/image_product.dart';
import 'package:wael/view/widget/product_page/skeletonizer_one_product.dart';
import 'package:wael/view/widget/store_page/head_of_storepage.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({
    super.key,
    required this.cartId,
  });
  final int cartId;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController(), permanent: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeadOfStorePage(),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<GetCartCubit, GetCartState>(
                    bloc: GetCartCubit()..getCrts(),
                    builder: (context, state) {
                      if (state is GetCartFetched) {
                        final cartData = state.productsCart
                            .singleWhere((element) => element.id == cartId);
                        cartController.quantity = cartData.quantity.obs;
                        return Column(
                          children: [
                            ImageProduct(
                              discount_percentage:
                                  cartData.product.discount_percentage,
                              image: cartData.product.image,
                            ),
                            BlocBuilder<OneProductCubit, OneProductState>(
                              bloc: OneProductCubit()
                                ..getProduct(productId: cartData.product.id),
                              builder: (context, state) {
                                if (state is OneProductFetched) {
                                  final brand = state.product;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // TextStyle(
                                        //             fontSize: 18,
                                        //             color: Colors.white,
                                        //           ),
                                        BrandWithRightTitle(
                                          name: brand.brand.name,
                                          image: brand.brand.image,
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (state is OneProductFailure) {
                                  return SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Text(state.errorMessage),
                                  );
                                } else {
                                  return const SkeletonizerBrandWithRightTitle();
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Product: ',
                                        style: TextStyle(
                                            color: AppColor.blue,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        cartData.product.name,
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Description: ',
                                        style: TextStyle(
                                            color: AppColor.blue,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        cartData.product.description,
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Divider(
                                    thickness: 4,
                                    color: AppColor.blue,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Price: ',
                                                style: TextStyle(
                                                    color: AppColor.blue,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                cartData.product.regular_price
                                                    .toString(),
                                                style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Discount price: ',
                                                style: TextStyle(
                                                    color: AppColor.blue,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                cartData.product.sale_price
                                                    .toString(),
                                                style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => Container(
                                          height: 30.h,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.r),
                                            ),
                                            border: Border.all(
                                                color: AppColor.blue,
                                                width: 2.w),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  cartController.decreament();
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: AppColor.blue,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                cartController.quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: AppColor.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  cartController.increament();
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: AppColor.blue,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            side: BorderSide(
                                              color: AppColor.yellow,
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          cartController.updateCart(
                                              cartId: cartData.id.toString(),
                                              productId: cartData.product.id
                                                  .toString(),
                                              newQuantity:
                                                  cartController.quantity);
                                          cartController.quantity = 0.obs;
                                          Get.back();
                                          // cartController.updateCart(
                                          //   cartId: cartData.id.toString(),
                                          //   quantity: cartController.quantity
                                          //       .toString(),
                                          // );
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 60, vertical: 12),
                                          child: Text(
                                            'Update cart',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (state is GetCartFailure) {
                        return Container(
                          width: 200,
                          height: 200,
                          color: AppColor.blue,
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return const SkeletonizerOneProduct();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
