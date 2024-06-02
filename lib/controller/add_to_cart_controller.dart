import 'package:get/get.dart';
import 'package:wael/data/model/api/models/product_model.dart';

class CartController extends GetxController {
  List<ProductModel> _cart = [];

  //getter
  List<ProductModel> get cart => _cart;


  void addToCart({required ProductModel product}) {
    _cart.add(product);
    update();
  }

  void removeFromCart({required ProductModel product}) {
    _cart.remove(product);
    update();
  }
}
