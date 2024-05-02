import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/head_of_search_logo.dart';
import 'package:wael/view/widget/home_page/market.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 35.h,
        ),
        const HeadOfSearch_logo(),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r),
                      ),
                      border: Border( bottom: BorderSide(color: AppColor.greyfateh, width: 3.w),
                        top: BorderSide(color: AppColor.greyfateh, width: 3.w),
                        left: BorderSide(color: AppColor.greyfateh, width: 3.w),
                      ),
                    ),
                    child: GridView.builder(
                      itemCount: 20,
                      padding:  EdgeInsets.all(10.r),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 3.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (_, index) {
                        return const Market();
                        //  Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //     border: Border.all(color: AppColor.blue, width: 3),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      border: Border.all(color: AppColor.blue, width: 3.w),
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                             SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Clothes',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Shoes',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Electronics',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                            Text(
                              'Housware',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 3.w,
                              height: 40.h,
                            ),
                          ],
                        )
                      ],
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
