import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/view/widget/product_page/favorite_button.dart';

class ProductFavorite extends StatefulWidget {
  const ProductFavorite(
      {super.key,
      this.isFavorite = false,
      required this.product_id,
      required this.onChange});
  final bool? isFavorite;
  final int? product_id;
  final Function(bool isFavorite)? onChange;
  @override
  State<ProductFavorite> createState() => _ProductFavoriteState();
}

class _ProductFavoriteState extends State<ProductFavorite> {
  // List<Change> product =
  //     ProductModel.products.map((e) => Change(isFavorite: false)).toList();
  late bool isFavorite = widget.isFavorite!;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 10.h),
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
                height: 130.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                ),
              ),
              SizedBox(
                height: 130.h,
                width: 141.5.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(100.r),
                  ),
                  child: Image.asset(
                    width: 142.w,
                    'assets/images/product_image_bijama.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Text(
                  '30%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -30,
                top: 0,
                bottom: 0.h,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/product_btn_addtocart.png',
                    height: 45.h,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cotton Pajamas',
                style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                '500,000 L.S',
                style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                '545,000 L.S',
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
                  ProductServices.likeProduct(product_id: widget.product_id!);
                } else {
                  ProductServices
                      .dislikeProduct(product_id: widget.product_id!);
                }
                if (widget.onChange != null) {
                  widget.onChange!(isFavorite);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
