import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/controller/cubits/get_cart/get_cart_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/update_product_page.dart';
import 'package:wael/view/widget/cart_page/box_details_payment.dart';
import 'package:wael/view/widget/cart_page/product_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int productId = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // ignore: invalid_use_of_protected_member
      init: CartController()..refresh,
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<GetCartCubit, GetCartState>(
              bloc: GetCartCubit()..getCrts(),
              builder: (context, state) {
                if (state is GetCartFetched) {
                  final cartData = controller.cartList;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cartData.length,
                      itemBuilder: (context, index) {
                        return ProductCart(
                          controller: controller,
                          cartId: cartData[index].id,
                          onRemovePressed: () {
                            controller.removeProductFromCart(
                                cartId: cartData[index].id);
                            controller.quantity = 0.obs;
                          },
                          onUpdatePressed: () {
                            controller.quantity = cartData[index].quantity.obs;
                            Get.to(() =>
                                UpdateProductPage(cartId: cartData[index].id));
                          },
                        );
                      },
                    ),
                  );
                } else if (state is GetCartFailure) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: AppColor.blue,
                    child: Text(state.errorMessage),
                  );
                } else {
                  return const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SkeletonizerProductCart(),
                          SkeletonizerProductCart(),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            BoxDetailsPayment(
              costAfterDiscounte: controller.totalDiscountPrice(),
              costBeforeDiscount: controller.totalPrice(),
              orderItems: controller.cartList,
              controller: controller,
            ),
          ],
        );
      },
    );
  }
}
