import 'package:wael/data/model/api/models/product_model.dart';

abstract class OrderModel {
  static List<ProductModel> order_items = [];
  static void addProductToCart({required ProductModel product}) {
    order_items.add(product);
  }
}
