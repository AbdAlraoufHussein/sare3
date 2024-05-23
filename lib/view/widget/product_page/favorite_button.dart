import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/core/constant/color.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
  });

  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.blue,
            )),
        child: Icon(
          isFavorite == false ? Icons.favorite_border : Icons.favorite,
          size: 20,
          color: AppColor.blue,
        ),
      ),
    );
  }
}
