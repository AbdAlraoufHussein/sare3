import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class InformationOfStore extends StatelessWidget {
  const InformationOfStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            '. Category: Clothing ',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            '. Address: Damascus Branch / Mezzeh Project opposite Khaled Ibn Al-Walid Mosque',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            '. Telephone: 3156294',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            '. Phone: 0956265849',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            '. We guarantee that any product we sell can be exchanged up to three days from the date of receipt or the purchase date',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Products',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColor.yellow,
                decorationThickness: 2,
                fontSize: 22,
                color: AppColor.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
