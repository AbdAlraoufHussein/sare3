import 'package:get/get.dart';
import 'package:wael/data/model/api/models/product_model.dart';

class CartController extends GetxController {
  RxMap _carts = {}.obs;

  get carts => _carts;

  List<ProductModel> productList = [];

  int quantity = 0;

  void increament({required ProductModel product}) {
    _carts[product] += 1;
  }

  void decreament({required ProductModel product}) {
    _carts[product] -= 1;
  }

  int totalDiscountPrice() {
    int total = 0;
    for (var i = 0; i < _carts.length; i++) {}
    return total;
  }

  List get totalList => _carts.entries
      .map((product) => product.key.regular_price * product.value)
      .toList();
  List get totalSaleList => _carts.entries
      .map((product) => product.key.sale_price * product.value)
      .toList();

  int totalPrice() {
    int total = 0;
    List<int> tt = [];
    for (int i = 0; i < totalList.length; i++) {
      tt.add(totalList[i]);
      total = total + tt[i];
    }
    return total;
  }

  int totalSalePrice() {
    int total = 0;
    List<int> tt = [];
    for (int i = 0; i < totalSaleList.length; i++) {
      tt.add(totalSaleList[i]);
      total = total + tt[i];
    }
  return total;
  }

  void addToCart({required ProductModel product}) {
    if (_carts.containsKey(product)) {
      productList.add(product);
      _carts[product] +=1;
    } else {
      _carts[product] = 1;
    }
    update();
  }

  void removeFromCart({required ProductModel product}) {
    productList.remove(product);
    _carts.removeWhere((key, value) => key == product);
    update();
  }
}
