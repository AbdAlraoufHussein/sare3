import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/profile_page/head_of_profile_page.dart';
import 'package:wael/view/widget/profile_page/image_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadOfProfilePage(),
          Expanded(
            child: ListView(
              children: [
                ImageProduct(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3), // Border width
                            decoration: BoxDecoration(
                              color: AppColor.blue,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(35), // Image radius
                                child: Image.asset("assets/images/hfhfe.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Hfhfe',
                            style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Shampoo hfhe with the Scent of Purple Roses.',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Men's Cotton Pajamas - Gray and Navy Blue.",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.green,
                        ),
                        child: Center(
                          child: Text(
                            'Available',
                            style: TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColor.blue,
                        indent: 5,
                        endIndent: 5,
                        thickness: 3,
                      ),
                      Text(
                        'Color :',
                        style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
