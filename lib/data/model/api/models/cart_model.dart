import 'package:wael/data/model/api/models/product_model.dart';

class CartModel {
  final int id;
  final ProductModel product;
  final double quantity;

  CartModel({required this.id, required this.product, required this.quantity});

  factory CartModel.fromJason(Map<String, dynamic> jsonData) {
    return CartModel(
        id: jsonData['id'],
        product: ProductModel.fromJson(jsonData['product']),
        quantity: jsonData['quantity']);
  }
}
