import 'dart:io';
import 'package:get/get.dart';
import 'package:wael/core/services/cart_service.dart';
import 'package:wael/data/model/api/models/cart_model.dart';

class CartController extends GetxController {
  RxInt quantity = 0.obs;
  List<CartModel> cartList = [];
  void increament() {
    quantity++;
    update();
  }

  void decreament() {
    if (quantity > 0) {
      quantity--;
    }
    update();
  }

  void addProductToCart({required int productId}) async {
    try {
      if (quantity > 0) {
        final cart = await CartServices.postCart(
            product_id: productId.toString(), quantity: quantity.toString());
        cartList.add(cart);
        Get.snackbar('Congrats', 'Product has been added succesfully.',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Notice', 'You havr to add Quantity first.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on HttpException catch (e) {
      Get.snackbar('Warning', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    quantity = 0.obs;
    update();
  }

  void removeProductFromCart({required int cartId}) async {
    try {
      await CartServices.deleteCart(cartId: cartId);
      cartList.removeWhere((element) => element.id == cartId);
      Get.snackbar('Congrats', 'Product has been deleted succesfully.',
          snackPosition: SnackPosition.BOTTOM);
    } on HttpException catch (e) {
      Get.snackbar('Warning', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    update();
  }

  int totalDiscountPrice() {
    int total = 0;
    for (var i = 0; i < cartList.length; i++) {
      total = total + (cartList[i].product.sale_price * cartList[i].quantity);
    }
    return total;
  }

  int totalPrice() {
    int total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total =
          total + (cartList[i].product.regular_price * cartList[i].quantity);
    }
    return total;
  }

  // RxMap _carts = {}.obs;

  // get carts => _carts;

  // List<ProductModel> productList = [];

  // int quantity = 0;
  // // int count = 0;

  // void increament({required ProductModel product}) {
  //   _carts[product] += 1;
  // }

  // void decreament({required ProductModel product}) {
  //   _carts[product] -= 1;
  // }

  // int totalDiscountPrice() {
  //   int total = 0;
  //   for (var i = 0; i < _carts.length; i++) {}
  //   return total;
  // }

  // List get totalList => _carts.entries
  //     .map((product) => product.key.regular_price * product.value)
  //     .toList();
  // List get totalSaleList => _carts.entries
  //     .map((product) => product.key.sale_price * product.value)
  //     .toList();

  // int totalPrice() {
  //   int total = 0;
  //   List<int> tt = [];
  //   for (int i = 0; i < totalList.length; i++) {
  //     tt.add(totalList[i]);
  //     total = total + tt[i];
  //   }
  //   return total;
  // }

  // int totalSalePrice() {
  //   int total = 0;
  //   List<int> tt = [];
  //   for (int i = 0; i < totalSaleList.length; i++) {
  //     tt.add(totalSaleList[i]);
  //     total = total + tt[i];
  //   }
  //   return total;
  // }

  // void addToCart({required ProductModel product}) {
  //   if (_carts[product] != 1 && _carts.containsKey(product)) {
  //     productList.add(product);
  //     _carts[product] += 1;
  //   } else {
  //     _carts[product] = 1;
  //   }
  //   update();
  // }

  // void removeFromCart({required ProductModel product}) {
  //   productList.remove(product);
  //   _carts.removeWhere((key, value) => key == product);
  //   update();
  // }
}
