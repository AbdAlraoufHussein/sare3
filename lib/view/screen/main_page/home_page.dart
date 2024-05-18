import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/hooks/banner_hook.dart';
import 'package:wael/core/hooks/brand_hook.dart';
import 'package:wael/view/widget/home_page/carosel_slider.dart';
import 'package:wael/view/widget/head_of_search_logo.dart';
import 'package:wael/view/widget/home_page/show_all_brands.dart';
import 'package:wael/view/widget/main_points.dart';
import 'package:wael/view/widget/home_page/brand.dart';
import 'package:wael/view/widget/product.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    final (bannersLoading, banners) = useBannerHook();
    final (brandsLoading, brands) = useBrandHook();
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
              Skeletonizer(
                enabled: bannersLoading,
                child: CaroselSlider(
                  carosellImages: banners
                      .map((e) => e.attributes.image.data.attributes.url)
                      .toList(),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MainPoints(
                  text: 'Brand',
                  widthspace: 195.w,
                  onTap: () {
                    Get.to(AllBrands());
                  }),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: brandsLoading
                      ? const Skeletonizer(
                          enabled: true,
                          child: Row(
                            children: [
                              Brand(),
                              Brand(),
                              Brand(),
                              Brand(),
                              Brand(),
                              Brand(),
                              Brand(),
                            ],
                          ),
                        )
                      : Row(
                          children: brands
                              .map((e) => Brand(
                                    name: e.attributes.name,
                                    imageUrl:
                                        e.attributes.image.data.attributes.url,
                                  ))
                              .toList(),
                        ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MainPoints(
                text: 'New Products',
                widthspace: 120.w,
                onTap: () {},
              ),
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
