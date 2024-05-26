import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.blue,
      ),
    );
  }
}
