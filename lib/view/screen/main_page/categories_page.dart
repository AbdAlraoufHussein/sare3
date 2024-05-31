import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/core/services/category_service.dart';
import 'package:wael/view/screen/main_page/store.dart';
import 'package:wael/view/widget/head_of_search_logo.dart';
import 'package:wael/view/widget/home_page/brand.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> categoriesList = const [
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
      CategoryButton(
        text: 'clothes',
      ),
    ];
    String category = '';
    return Column(
      children: [
        const HeadOfSearchLogo(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          topLeft: Radius.circular(15.r),
                        ),
                        border: Border(
                          bottom:
                              BorderSide(color: AppColor.greyfateh, width: 3.w),
                          top:
                              BorderSide(color: AppColor.greyfateh, width: 3.w),
                          left:
                              BorderSide(color: AppColor.greyfateh, width: 3.w),
                        ),
                      ),
                      child: FutureBuilder(
                        future: BrandService.getAllBrands(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Skeletonizer(
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 3.3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
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
                              crossAxisCount: 2,
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
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      border: Border.all(color: AppColor.blue, width: 3.w),
                    ),
                    child: FutureBuilder(
                      future: CategoryServices().getCategories(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Skeletonizer(
                            child: SingleChildScrollView(
                              child: Column(
                                children: categoriesList,
                              ),
                            ),
                          );
                        }
                        final categoryData = snapshot.data!;
                        return ListView.builder(
                          itemCount: categoryData.length,
                          itemBuilder: (context, index) {
                            return CategoryButton(
                              onTap: () {
                                setState(() {
                                  category = categoryData[index].name;
                                  print(category);
                                });
                              },
                              text: categoryData[index].name,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: AppColor.blue,
          width: 3,
        ))),
        height: 60.h,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SkeletonizerBrand extends StatelessWidget {
  const SkeletonizerBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.r), // Border width
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
              child: SizedBox.fromSize(
                size: Size.fromRadius(30.r), // Image radius
                child: Image.asset("assets/images/hfhfe.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              "hfhfe",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
