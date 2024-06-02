import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaroselSlider extends StatelessWidget {
  const CaroselSlider({
    super.key,
    required this.carosellImages,
    required this.itemCount,
  });

  final List<String> carosellImages;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CarouselSlider.builder(
        itemCount: carosellImages.length,
        itemBuilder: (_, int itemIndex, __) => SizedBox(
          child: carosellImages.isNotEmpty
              ? Image.network(
                  carosellImages[itemIndex],
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/carosel1.png'),
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

class SkeletonizerCaroselSlider extends StatelessWidget {
  const SkeletonizerCaroselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/carosel1.png',
      'assets/images/carosel2.png',
      'assets/images/carosel3.png',
      'assets/images/carosel4.png'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (_, int itemIndex, __) => SizedBox(
          child: Image.asset(images[itemIndex]),
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
