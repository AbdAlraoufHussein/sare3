import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/brand_on_category/brand_on_category_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/constant/routes.dart';
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
  int categoryId = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadOfSearchLogo(
          onFavoritePressed: () {
            Get.offNamed(AppRoute.favoritePage);
          },
        ),
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
                          bottom: BorderSide(
                              color: AppColor.greyfateh, width: 3.w),
                          top: BorderSide(
                              color: AppColor.greyfateh, width: 3.w),
                          left: BorderSide(
                              color: AppColor.greyfateh, width: 3.w),
                        ),
                      ),
                      child: BlocBuilder<BrandOnCategoryCubit,
                          BrandOnCategoryState>(
                        bloc: BrandOnCategoryCubit()
                          ..getBrandOnCategory(categoryId: categoryId),
                        builder: (context, state) {
                          if (state is BrandOnCategoryFetched) {
                            final brandData = state.brandData;
                            return GridView.builder(
                              itemCount: brandData.length,
                              padding: EdgeInsets.all(10.r),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 130,
                                childAspectRatio: 3 / 3.3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
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
                          } else if (state is BrandOnCategoryFailure) {
                            return Container(
                              width: 200,
                              height: 200,
                              color: AppColor.blue,
                              child: Text(state.errorMessage),
                            );
                          } else {
                            return Skeletonizer(
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 3.3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                children: const [
                                  SkeletonizerBrand(),
                                  SkeletonizerBrand(),
                                  SkeletonizerBrand(),
                                  SkeletonizerBrand(),
                                ],
                              ),
                            );
                          }
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
                                  categoryId = categoryData[index].id;
                                  print(categoryId);
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
