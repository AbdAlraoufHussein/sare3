import 'package:flutter/material.dart';
import 'package:wael/view/widget/home_page/carosel_slider.dart';
import 'package:wael/view/widget/home_page/head_of_homepage.dart';
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
        const SizedBox(
          height: 35,
        ),
        const HeadOfHomePage(),
        const SizedBox(
          height: 22,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: const [
              CaroselSlider(),
              MainPoints(text: 'Marka', widthspace: 180),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: SingleChildScrollView(
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
              MainPoints(text: 'New Products', widthspace: 110),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: SingleChildScrollView(
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
