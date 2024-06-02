import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/cart_model.dart';

abstract class CartServices extends BaseApi {
  Future<List<CartModel>> getCart() async {
    final response = await BaseApi().getRequest(endPoint: 'carts');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => CartModel.fromJason(e))
        .toList();
    return data;
  }

  static Future<void> postCart({
    required int product_id,
    required int quantity,
  }) async {
    await BaseApi().postRequest(endPoint: 'carts', data: {
      'product_id': product_id,
      'quantity': quantity,
    });
  }
}
