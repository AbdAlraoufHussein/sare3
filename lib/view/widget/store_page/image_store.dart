import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class ImageStore extends StatelessWidget {
  const ImageStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              size: Size.fromRadius(50), // Image radius
              child: Image.asset("assets/images/image_store_adidas.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "Adidas",
            style: TextStyle(
                fontSize: 18,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
