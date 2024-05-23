import 'package:get/get.dart';

class FavoriteController extends GetxController {
  bool isFavorite = false;
  void changeFavorite() {
    isFavorite = !isFavorite;
  }
}
