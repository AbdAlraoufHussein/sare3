import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;
  void increament() {
    counter++;
    update();
  }

  void decreament() {
    if (counter != 0) counter--;
    update();
  }
}
