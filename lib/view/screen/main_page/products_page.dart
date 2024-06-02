import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/widget/head_title.dart';
import 'package:wael/view/widget/product.dart';

import 'product_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const HeadTitle(
              title: 'Products List',
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: BlocBuilder<ProductCubit, ProductState>(
                  bloc: ProductCubit()..getProducts(),
                  builder: (context, state) {
                    if (state is ProductFetched) {
                      final productData = state.productData;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 270,
                          childAspectRatio: 3 / 3.3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: productData.length,
                        itemBuilder: (context, index) {
                          return Product(
                              
                            onProductTap: () {
                              Get.to(() => ProductPage(
                                    product_id: productData[index].id,
                                  ));
                            },
                            onChange: (isFavorite) {
                              productData[index].is_favorite_for_current_user =
                                  isFavorite;
                            },
                            isFavorite:
                                productData[index].is_favorite_for_current_user,
                            product_id: productData[index].id,
                            discountPercentage:
                                productData[index].discount_percentage,
                            discountPrice: productData[index].sale_price,
                            image: productData[index].image,
                            name: productData[index].name,
                            realPrice: productData[index].regular_price,
                          );
                        },
                      );
                    } else if (state is ProductFailure) {
                      return Container(
                        width: 200,
                        height: 200,
                        child: Text(state.errorMessage),
                      );
                    }
                    return Skeletonizer(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 270,
                          childAspectRatio: 3 / 3.3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        children: const [
                          SkeletonizerProduct(),
                          SkeletonizerProduct(),
                          SkeletonizerProduct(),
                          SkeletonizerProduct(),
                          SkeletonizerProduct(),
                          SkeletonizerProduct(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
