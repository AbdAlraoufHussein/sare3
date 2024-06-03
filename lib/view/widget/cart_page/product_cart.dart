import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/controller/add_to_cart_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/data/model/api/models/product_model.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.quantity,
    required this.product,
    required this.controller,
    required this.index,
  });
  final int quantity;
  final ProductModel product;
  final CartController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  '${product.discount_percentage.toString()}%',
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ const Spacer(
                      flex: 2,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      '${product.sale_price} L.S',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '${product.regular_price} L.S',
                      style: TextStyle(
                        decorationColor: AppColor.yellow,
                        decoration: TextDecoration.lineThrough,
                        color: AppColor.yellow,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Container(
                      height: 30.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.r),
                        ),
                        border: Border.all(color: AppColor.blue, width: 2.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.decreament(product: product);
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
                            quantity.toString(),
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
                              controller.increament(product: product);
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
                ),IconButton(
                      onPressed: () {
                        controller.removeFromCart(product: product);
                      },
                      icon: const Icon(Icons.close),
                      iconSize: 16,
                      color: AppColor.blue,
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
