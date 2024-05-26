import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class ImageStore extends StatelessWidget {
  const ImageStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                size: const Size.fromRadius(50), // Image radius
                child: Image.asset("assets/images/image_store_adidas.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Adidas",
            style: TextStyle(
                fontSize: 22,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
