import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/view/screen/main_page/categories_page.dart';
import 'package:wael/view/screen/main_page/store.dart';
import 'package:wael/view/widget/head_title.dart';
import 'package:wael/view/widget/home_page/brand.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const HeadTitle(title: 'Brands List'),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: FutureBuilder(
                            future: BrandService.getAllBrands(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Skeletonizer(
                                  child: GridView(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 3 / 3.3,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    children: const [
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                      SkeletonizerBrand(),
                                    ],
                                  ),
                                );
                              }
                              final brandData = snapshot.data!;
                              return GridView.builder(
                                itemCount: brandData.length,
                                padding: EdgeInsets.all(10.r),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 120,
                                  childAspectRatio: 3 / 3.3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return Brand(
                                    onTap: () {
                                      Get.to(() => StorePage(
                                            brandId: brandData[index].id,
                                          ));
                                    },
                                    name: brandData[index].name,
                                    imageUrl: brandData[index].image,
                                  );
                                },
                              );
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
