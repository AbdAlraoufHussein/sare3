import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class ProductFavorite extends StatelessWidget {
  const ProductFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxHeight: 250),
        child: Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Container(
                    height: 130,
                    width: 140,
                    decoration: BoxDecoration(
                      color: AppColor.red,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(95),
                    ),
                    child: Image.asset(
                      'assets/images/product_image_bijama.png',
                      width: 142.5,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 105, left: 105),
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
                  padding: const EdgeInsets.only(left: 141),
                  child: Container(
                    height: 130,
                    width: 201,
                    decoration: BoxDecoration(
                      color: AppColor.greyfateh,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 170,
                  ),
                  child: Expanded(
                    child: Text(
                      'Cotton Pajamas',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 170),
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
                  padding: const EdgeInsets.only(top: 100, left: 170),
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
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 290),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/delete.png',
                      height: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 110),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/product_btn_addtocart.png',
                      height: 45,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}