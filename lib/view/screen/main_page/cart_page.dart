import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/view/widget/cart_page/box_details_payment.dart';
import 'package:wael/view/widget/cart_page/product_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: ListView(
            children: const [
              ProductOfCart(),
              ProductOfCart(),
              ProductOfCart(),
              ProductOfCart(),
              ProductOfCart(),
              ProductOfCart(),
            ],
          ),
        ),
         SizedBox(
          height: 10.h,
        ),
        ////
       const BoxDetailsPayment(),
      ],
    );
  }
}
