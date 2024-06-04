import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/controller/cubits/get_cart/get_cart_cubit.dart';
import 'package:wael/core/constant/color.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.cartId,
    required this.controller,
    required this.onRemovePressed,
    required this.onUpdatePressed,
  });
  final int cartId;
  final CartController controller;
  final void Function() onRemovePressed;
  final void Function() onUpdatePressed;

  @override
  Widget build(BuildContext context) {
    return 
    BlocBuilder<GetCartCubit, GetCartState>(
      bloc: GetCartCubit()..getCrts(),
      builder: (context, state) {
        if (state is GetCartFetched) {
          final cart =
              state.productsCart.singleWhere((element) => element.id == cartId);
          return Container(
            height: 130.h,
            margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
            decoration: BoxDecoration(
              color: AppColor.greyfateh,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                        ),
                        color: AppColor.red,
                      ),
                      height: 156.h,
                      width: 155.w,
                    ),
                    SizedBox(
                      height: 156.h,
                      width: 156.3.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(95.r),
                        ),
                        child: Image.network(
                          cart.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Text(
                        '${cart.product.discount_percentage.toString()}%',
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
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        cart.product.name,
                        style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${cart.product.sale_price} L.S',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${cart.product.regular_price} L.S',
                        style: TextStyle(
                          decorationColor: AppColor.yellow,
                          decoration: TextDecoration.lineThrough,
                          color: AppColor.yellow,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Quantity: ${cart.quantity}',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: onRemovePressed,
                      icon: const Icon(Icons.delete),
                      iconSize: 20,
                      color: AppColor.blue,
                    ),
                    IconButton(
                      onPressed: onUpdatePressed,
                      icon: const Icon(Icons.edit),
                      iconSize: 20,
                      color: AppColor.blue,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const SingleChildScrollView(
                      child: Column(
                        children: [
                          SkeletonizerProductCart(),
                          SkeletonizerProductCart(),
                        ],
                      ),
                    );
        } 
      },
    );
  }
}

class SkeletonizerProductCart extends StatelessWidget {
  const SkeletonizerProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        height: 130.h,
        margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
        decoration: BoxDecoration(
          color: AppColor.greyfateh,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                    ),
                    color: AppColor.red,
                  ),
                  height: 156.h,
                  width: 155.w,
                ),
                SizedBox(
                  height: 156.h,
                  width: 156.3.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(95.r),
                    ),
                    child: Image.asset(
                      'assets/images/product_image_hfhfe.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Text(
                    '50 %',
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
              padding: const EdgeInsets.only(left: 8, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'name',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '1000 L.S',
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '1000 L.S',
                    style: TextStyle(
                      decorationColor: AppColor.yellow,
                      decoration: TextDecoration.lineThrough,
                      color: AppColor.yellow,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Quantity: 5',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
              iconSize: 16,
              color: AppColor.blue,
            )
          ],
        ),
      ),
    );
  }
}
