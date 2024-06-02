import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/cart_model.dart';
import 'package:wael/data/model/api/models/product_model.dart';

abstract class CartServices extends BaseApi {
  Future<List<CartModel>> getCart() async {
    final response = await BaseApi().getRequest(endPoint: 'carts');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => CartModel.fromJason(e))
        .toList();
    return data;
  }

  static Future<void> postCart({
    required List<ProductModel> orderItems,
  }) async {
    await BaseApi().postRequest(endPoint: 'carts', data: {
      'order_items': orderItems,
    });
  }
}
