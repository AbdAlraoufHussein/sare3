import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/view/widget/home_page/carosel_slider.dart';
import 'package:wael/view/widget/home_page/market.dart';
import 'package:wael/view/widget/home_page/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image(
                        image: AssetImage("assets/images/notifications.png"),
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Image(
                      image: AssetImage("assets/images/favorite.png"),
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 180,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 260,
                      child: TextField(
                        onChanged: null,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          prefixIcon: Transform.scale(
                            scale: 0.3,
                            child: const Image(
                              image: AssetImage('assets/images/search.png'),
                            ),
                          ),
                          hintText: ' search',
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 69, 126),
                              width: 2,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 69, 126),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 65,
                        height: 65,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Image(
                        image: AssetImage("assets/images/shm.png"),
                        width: 8,
                      ),
                      const Spacer(flex: 1),
                      Text(
                        'Show All',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.blue,
                        ),
                      ),
                      const Spacer(flex: 10),
                      Text(
                        'Marka',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Market(),
                        Market(),
                        Market(),
                        Market(),
                        Market(),
                        Market(),
                        Market(),
                      ],
                    ),
                  ),
                ),
                const CaroselSlider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Image(
                        image: AssetImage("assets/images/shm.png"),
                        width: 8,
                      ),
                      const Spacer(flex: 1),
                      Text(
                        'Show All',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.blue,
                        ),
                      ),
                      const Spacer(flex: 10),
                      Text(
                        'New Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    reverse: true,
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
                  width: 50,
                ),
                Text(''),
                Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
