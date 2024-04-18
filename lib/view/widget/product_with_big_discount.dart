import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class ProductWithBigDiscount extends StatelessWidget {
  const ProductWithBigDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  color: AppColor.red,
                ),
                height: 156,
                width: 155,
              ),
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(95),
                  ),
                  child: Image.asset(
                    'assets/images/product_image_shoes.png',
                    height: 156,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 120),
                child: Text(
                  '50%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 156),
                child: Container(
                  height: 100,
                  width: 155,
                  decoration: BoxDecoration(
                    color: AppColor.greyfateh,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 128, left: 55),
                child: Image.asset(
                  'assets/images/product_btn_addtocart.png',
                  height: 42,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 175,
                  left: 8,
                ),
                child: Text(
                  'Shoes And Shirt',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 218, left: 118),
                child: Image.asset(
                  'assets/images/product_favorate.png',
                  height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210, left: 8),
                child: Text(
                  '400,000 L.S',
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230, left: 8),
                child: Text(
                  '800,000 L.S',
                  style: TextStyle(
                    decorationColor: AppColor.yellow,
                    decoration: TextDecoration.lineThrough,
                    color: AppColor.yellow,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
