import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/view/widget/product_page/favorite_button.dart';

class Product extends StatefulWidget {
  const Product({
    super.key,
    this.isFavorite = false,
    required this.product_id,
    this.onChange,
    required this.discountPercentage,
    required this.discountPrice,
    required this.realPrice,
    required this.image,
    required this.name,
    required this.onProductTap,
  });
  final bool isFavorite;
  final int product_id;
  final Function(bool isFavorite)? onChange;
  final int discountPercentage;
  final int discountPrice;
  final int realPrice;
  final String image;
  final String name;
  final void Function() onProductTap;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late bool isFavorite = widget.isFavorite;
  @override
  Widget build(BuildContext context) {
    // List<Map> products = [];
    // final List<Change> product =
    //     products.map((e) => Change(isFavorite: false)).toList();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 250.h,
      width: 155.w,
      decoration: BoxDecoration(
          color: AppColor.greyfateh, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  color: AppColor.red,
                ),
                height: 156.h,
                width: 155.w,
              ),
              InkWell(
                onTap: widget.onProductTap,
                child: SizedBox(
                  height: 156.h,
                  width: 155.3.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                      bottomRight: Radius.circular(95.r),
                    ),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  '${widget.discountPercentage.toString()}%',
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
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.discountPercentage} L.S',
                          style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '${widget.realPrice} L.S',
                          style: TextStyle(
                            decorationColor: AppColor.yellow,
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.yellow,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    FavoriteButton(
                      isFavorite: isFavorite,
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite) {
                            ProductServices.likeProduct(
                                product_id: widget.product_id.toString());
                          } else {
                            ProductServices.dislikeProduct(
                                product_id: widget.product_id.toString());
                          }
                          if (widget.onChange != null) {
                            widget.onChange!(isFavorite);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
