import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/product.dart';
import 'package:wael/view/widget/product_page/head_of_product_page.dart';
import 'package:wael/view/widget/product_page/image_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeadOfProductPage(),
          Expanded(
            child: ListView(
              children: [
                ImageProduct(),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                size: Size.fromRadius(35.r), // Image radius
                                child: Image.asset("assets/images/hfhfe.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'Hfhfe',
                            style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Shampoo hfhe with the Scent of Purple Roses.',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Men's Cotton Pajamas - Gray and Navy Blue.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColor.green,
                        ),
                        child: Center(
                          child: Text(
                            'Available',
                            style: TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        color: AppColor.blue,
                        indent: 5.w,
                        endIndent: 5.w,
                        thickness: 3.w,
                      ),
                      Text(
                        'Color:',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease,
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColor.red,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease,
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColor.green,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease,
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: AppColor.yellow,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease,
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColor.pink,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Description:',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        'Category: Clothing plxfgnbsn [xldmgpsdn] Clothing plxfgnbsn [xldmgpsdn Clothing plxfgnbsn [xldmgpsdnvClothing plxfgnbsn [xldmgpsdn vClothing plxfgnbsn [xldmgpsdnClothing plxfgnbsn [xldmgpsdnClothing plxfgnbsn [xldmgpsdnClothing plxfgnbsn isjbif izjiu ij zvoiboibn ozxvnouxz voixznvubxz xjzbvuz vxzjbvxzi vxjzbvxz vxojz vk zxkvjbxzoj vj ',
                        maxLines: null,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'You may also like:',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
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
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(color: AppColor.blue, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '500,000 L.S',
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColor.blue, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.remove,
                                  color: AppColor.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.blue,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          side: BorderSide(
                            color: AppColor.yellow,
                            width: 3,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
