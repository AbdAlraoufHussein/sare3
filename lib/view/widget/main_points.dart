import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class MainPoints extends StatelessWidget {
  const MainPoints({super.key, required this.text, required this.widthspace});
  final String text;
  final double widthspace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.blue),
          ),
          SizedBox(
            width: widthspace,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Show All',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColor.blue,
              ),
            ),
          ),
          Icon(
            Icons.arrow_circle_right_rounded,
            size: 20,
            color: AppColor.blue,
          ),
        ],
      ),
    );
  }
}