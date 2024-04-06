import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class LangaugeBtn extends StatelessWidget {
  const LangaugeBtn({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          side: BorderSide(
            color: AppColor.blue,
            width: 3,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
