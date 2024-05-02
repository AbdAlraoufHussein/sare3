import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/view/widget/home_page/carosel_slider.dart';
import 'package:wael/view/widget/head_of_search_logo.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/home_page/market.dart';
import 'package:wael/view/widget/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 35.h,
        ),
        const HeadOfSearch_logo(),
        SizedBox(
          height: 22.h,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              const CaroselSlider(),
              MainPoints(text: 'Marka', widthspace: 180.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Market(),
                      Market(),
                      Market(),
                      Market(),
                      Market(),
                      Market(),
                      Market(),
                    ],
                  ),
                ),
              ),
              MainPoints(text: 'New Products', widthspace: 110.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: const SingleChildScrollView(
                  // reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Product(),
                      Product(),
                      Product(),
                      Product(),
                      Product(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
