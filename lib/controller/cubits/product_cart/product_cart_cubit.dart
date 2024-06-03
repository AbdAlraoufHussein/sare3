import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:wael/data/model/api/models/product_model.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  ProductCartCubit() : super(ProductCartInitial());
  RxMap cart = {}.obs;

  get carts => cart;

  List<ProductModel> productList = [];

  int quantity = 0;

  void increament({required ProductModel product}) {
    cart[product] += 1;
  }

  void decreament({required ProductModel product}) {
    cart[product] -= 1;
  }

  int totalDiscountPrice() {
    int total = 0;
    for (var i = 0; i < cart.length; i++) {}
    return total;
  }

  List get totalList => cart.entries
      .map((product) => product.key.regular_price * product.value)
      .toList();
  List get totalSaleList => cart.entries
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
    if (cart.containsKey(product)) {
      productList.add(product);
      cart[product] += 1;
    } else {
      cart[product] = 1;
    }
      Get.snackbar('Congrats', 'Product Added succesfully');

  }

  void removeFromCart({required ProductModel product}) {
    productList.remove(product);
    cart.removeWhere((key, value) => key == product);
  }
}
