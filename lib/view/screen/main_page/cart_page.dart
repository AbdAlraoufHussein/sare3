import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/data/model/api/models/product_model.dart';
import 'package:wael/view/widget/cart_page/box_details_payment.dart';
import 'package:wael/view/widget/cart_page/product_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;
  int cost = 0;
  int costAfterDiscounte = 0;
  int costBeforeDiscount = 0;
  void increament(ProductModel product) {
    setState(() {
      count++;
      cost = count * product.sale_price;
      costAfterDiscounte = count * product.sale_price;
      costBeforeDiscount = count * product.regular_price;
    });
  }

  void decreament(ProductModel product) {
    setState(() {
      count--;
      cost = count * product.sale_price;
      costAfterDiscounte = count * product.sale_price;
      costBeforeDiscount = count * product.regular_price;
    });
  }

  final controller = Get.put(CartController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.carts.length,
                itemBuilder: (context, index) {
                  return ProductCart(
                    controller: controller,
                    index: index,
                    product: controller.carts.keys.toList()[index],
                    quantity: controller.carts.values.toList()[index],
                  );
                },
              ),
            ),
            BoxDetailsPayment(
              costAfterDiscounte: controller.totalSalePrice(),
              costBeforeDiscount: controller.totalPrice(),
            ),
          ],
        ));
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
