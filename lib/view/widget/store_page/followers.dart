import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class Followers extends StatelessWidget {
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Followers",
          style: TextStyle(
              fontSize: 18, color: AppColor.blue, fontWeight: FontWeight.bold),
        ),
        Text(
          "8k",
          style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              decorationColor: AppColor.blue,
              fontSize: 18,
              color: AppColor.blue,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
