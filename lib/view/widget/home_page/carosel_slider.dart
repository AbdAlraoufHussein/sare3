import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/class/base_api_class.dart';
import 'package:wael/core/constant/imageasset.dart';

class CaroselSlider extends StatelessWidget {
  const CaroselSlider({super.key, required this.carosellImages});

  final List<String> carosellImages;

  static final _carosellImages = [
    AppImageAsset.caroselOne,
    AppImageAsset.caroselTwo,
    AppImageAsset.caroselThree,
    AppImageAsset.caroselFour,
  ];

  List<String> getImages() =>
      carosellImages.isNotEmpty ? carosellImages : _carosellImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CarouselSlider.builder(
        itemCount: getImages().length,
        itemBuilder: (_, int itemIndex, __) => SizedBox(
          child: carosellImages.isEmpty
              ? Image.asset(getImages()[itemIndex])
              : Image.network(BaseApi.domain + getImages()[itemIndex]),
        ),
        options: CarouselOptions(
          height: 130.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.27,
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
