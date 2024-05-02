import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/product_image_hfhfe.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColor.red,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    child: Text(
                      '30%',
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Image.asset(
                  'assets/images/product_favorate.png',
                  height: 42,
                ),
              ),
            ],
          ),
        )
     ;
  }
}