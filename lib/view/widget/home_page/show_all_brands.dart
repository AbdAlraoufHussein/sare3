import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/home_page/brand.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'All Brands',
              style: TextStyle(
                color: AppColor.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Brand(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
