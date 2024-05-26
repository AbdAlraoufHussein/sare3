import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/cart_page/box_details_payment.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;
  double discountPercentage = 30;
  double discountPrice = 700;
  double realPrice = 1000;
  double cost = 0;
  double costAfterDiscounte = 0;
  double costBeforeDiscount = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
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
                              'assets/images/product_image_bijama.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Text(
                            '${discountPercentage.toString()}%',
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
                      padding:
                          const EdgeInsets.only(left: 8, top: 0, bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'cotton bejama',
                                style: TextStyle(
                                    color: AppColor.blue,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.close),
                                iconSize: 16,
                                color: AppColor.blue,
                              )
                            ],
                          ),
                          Text(
                            '${discountPrice.toString()} L.S',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '${realPrice.toString()} L.S',
                            style: TextStyle(
                              decorationColor: AppColor.yellow,
                              decoration: TextDecoration.lineThrough,
                              color: AppColor.yellow,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Container(
                            height: 30.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              border:
                                  Border.all(color: AppColor.blue, width: 2.w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count--;
                                      cost = count * discountPrice;
                                      costAfterDiscounte =
                                          count * discountPrice;
                                      costBeforeDiscount = count * realPrice;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColor.blue,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(
                                  count.toString(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColor.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                      cost = count * discountPrice;
                                      costAfterDiscounte =
                                          count * discountPrice;
                                      costBeforeDiscount = count * realPrice;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: AppColor.blue,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        BoxDetailsPayment(
          cost: cost,
          costAfterDiscounte: costAfterDiscounte,
          costBeforeDiscount: costBeforeDiscount,
        ),
      ],
    );
  }
}
