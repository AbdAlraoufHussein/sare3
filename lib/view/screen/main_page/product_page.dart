import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/controller/cubits/get_one_product/one_product_cubit.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/data/model/api/models/product_model.dart';
import 'package:wael/view/widget/product_page/image_product.dart';
import 'package:wael/view/widget/product_page/skeletonizer_one_product.dart';
import 'package:wael/view/widget/store_page/head_of_storepage.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product_id,
  });
  final int product_id;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController(), permanent: true);
    return BlocProvider(
      create: (context) => OneProductCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const HeadOfStorePage(),
              Expanded(
                child: ListView(
                  children: [
                    BlocBuilder(
                      bloc: ProductCubit()..getProducts(),
                      builder: (context, state) {
                        if (state is ProductFetched) {
                          final productData = state.productData.singleWhere(
                              (element) => element.id == product_id);
                          return Column(
                            children: [
                              ImageProduct(
                                discount_percentage:
                                    productData.discount_percentage,
                                image: productData.image,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productData.name,
                                      style: TextStyle(
                                          color: AppColor.blue,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
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
                                          productData.description,
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 4,
                                      color: AppColor.blue,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: TextStyle(
                                              color: AppColor.blue,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          productData.regular_price.toString(),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          productData.sale_price.toString(),
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 16.sp,
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
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              side: BorderSide(
                                                color: AppColor.yellow,
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            cartController.addToCart(
                                                product: ProductModel(
                                                    id: productData.id,
                                                    name: productData.name,
                                                    description:
                                                        productData.description,
                                                    image: productData.image,
                                                    regular_price: productData
                                                        .regular_price,
                                                    sale_price:
                                                        productData.sale_price,
                                                    on_sale:
                                                        productData.on_sale,
                                                    discount_percentage:
                                                        productData
                                                            .discount_percentage,
                                                    is_favorite_for_current_user:
                                                        productData
                                                            .is_favorite_for_current_user));
                                                            Get.defaultDialog(title: 'asafaf');
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 60, vertical: 12),
                                            child: Text(
                                              'Add to cart',
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
                        } else if (state is OneProductFailure) {
                          return Container(
                            width: 200,
                            height: 200,
                            child: Text(state.errorMessage),
                          );
                        } else {
                          return SkeletonizerOneProduct();
                        }
                      },
                    )
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
