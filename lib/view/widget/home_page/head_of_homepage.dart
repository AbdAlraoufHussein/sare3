import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/screen/main_page/favorite_page.dart';

class HeadOfHomePage extends StatelessWidget {
  const HeadOfHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: 58,
                height: 58,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 55,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              border: Border(
                top: BorderSide(color: AppColor.blue, width: 2),
                bottom: BorderSide(color: AppColor.blue, width: 2),
                left: BorderSide(color: AppColor.blue, width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const FavoratePage());
                  },
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: AppColor.blue,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            width: 219,
            child: TextField(
              onChanged: null,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Transform.scale(
                  scale: 0.3,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/search.png',
                    ),
                  ),
                ),
                hintText: ' search',
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    topLeft: Radius.circular(0),
                  ),
                  borderSide: BorderSide(
                    color: AppColor.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(25),
                  ),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 69, 126),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
