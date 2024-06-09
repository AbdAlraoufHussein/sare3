import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/data/model/api/models/cart_model.dart';
import 'package:wael/helpers/stripe_helper.dart';

class BoxDetailsPayment extends StatelessWidget {
  const BoxDetailsPayment(
      {super.key,
      required this.costBeforeDiscount,
      required this.costAfterDiscounte,
      required this.orderItems,
      required this.controller});
  final int costBeforeDiscount;
  final int costAfterDiscounte;
  final List<CartModel> orderItems;
  final CartController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        border: Border(
          left: BorderSide(color: AppColor.blue, width: 3.w),
          right: BorderSide(color: AppColor.blue, width: 3.w),
          top: BorderSide(color: AppColor.blue, width: 3.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Cost:',
            style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          Row(
            children: [
              Text(
                '. Before discount: ',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                '${costBeforeDiscount.toString()} L.S',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColor.yellow,
                  color: AppColor.yellow,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '. After discount: ',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                '${costAfterDiscounte.toString()} L.S',
                style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  side: BorderSide(
                    color: AppColor.yellow,
                    width: 3.w,
                  ),
                ),
              ),
              onPressed: () async {
                StripeHelper.stripe(
                    salePrice: costAfterDiscounte, controller: controller);
              },
              child: Text(
                'Payment for reservation',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
