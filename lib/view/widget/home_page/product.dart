import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
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
              Image.asset(
                'assets/images/product_image_hfhfe.png',
                width: 155,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 120),
                child: Text(
                  '30%',
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
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: AppColor.blue),
                      bottom: BorderSide(color: AppColor.blue),
                      left: BorderSide(color: AppColor.blue),
                      right: BorderSide(color: AppColor.blue),
                    ),
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
                  'Hfhfe shampoo',
                  style: TextStyle(
                      color: AppColor.black,
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
                  '500,000 L.S',
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
                  '545,000 L.S',
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
