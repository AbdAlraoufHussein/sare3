import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wael/core/constant/imageasset.dart';

class CaroselSlider extends StatelessWidget {
  const CaroselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CarouselSlider.builder(
        //   controller: controller.pageController,
        // onPageChanged: (val) => {
        //   controller.pageChanged(val)
        // },
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            const SizedBox(
          child: Image(
            image: AssetImage(AppImageAsset.caroselOne),
          ),
          // child: PageView.builder(
          //   itemBuilder: (context, i) => Container(
          //     child: Image.asset(caroselList[i].image!),
          //   ),
          // ),
        ),
        options: CarouselOptions(
          height: 170,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {
            // AssetImage(caroselList[index].image!);
            // controller.pageChanged(index);
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
