import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/counter_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/product_page/favorite_button.dart';

class ProductOfCart extends StatelessWidget {
  const ProductOfCart({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController(), permanent: true);

    return Container(
      height: 130.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColor.greyfateh,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  color: AppColor.red,
                ),
                height: 156.h,
                width: 155.w,
              ),
              SizedBox(
                height: 156.h,
                width: 156.3.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(95.r),
                  ),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/images/product_image_bijama.png',
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  '30%',
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cotton Pajamas',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '500,000 L.S',
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '545,000 L.S',
                  style: TextStyle(
                    decorationColor: AppColor.yellow,
                    decoration: TextDecoration.lineThrough,
                    color: AppColor.yellow,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Spacer(
                  flex: 1,
                ),
                Counter(
                  onDecreament: () {
                    counterController.decreament();
                  },
                  onIncreament: () {
                    counterController.increament();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.onIncreament,
    required this.onDecreament,
  });
  final void Function()? onIncreament;
  final void Function()? onDecreament;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            border: Border.all(color: AppColor.blue, width: 2.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onDecreament,
                child: Icon(
                  Icons.remove,
                  color: AppColor.blue,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GetBuilder<CounterController>(
                builder: (controller) {
                  return Text(
                    controller.counter.toString(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: onIncreament,
                child: Icon(
                  Icons.add,
                  color: AppColor.blue,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/delete.png',
            height: 20.h,
          ),
        ),
      ],
    );
  }
}

// Container(
//                 height: 130.h,
//                 width: 140.w,
//                 decoration: BoxDecoration(
//                   color: AppColor.red,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15.r),
//                     bottomLeft: Radius.circular(15.r),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 130.h,
//                 width: 141.5.w,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15.r),
//                     bottomLeft: Radius.circular(15.r),
//                     bottomRight: Radius.circular(100.r),
//                   ),
//                   child: Image.asset(
//                     width: 142.w,
//                     'assets/images/product_image_bijama.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 5.h,
//                 right: 3.w,
//                 child: Text(
//                   '30%',
//                   style: TextStyle(
//                     color: AppColor.yellow,
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
