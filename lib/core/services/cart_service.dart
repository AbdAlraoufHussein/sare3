import 'dart:convert';

import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/cart_model.dart';
import 'package:wael/view/widget/product.dart';

class CartServices extends BaseApi {
  Future<List<CartModel>> getCart() async {
    final response = await BaseApi().getRequest(endPoint: 'carts');
    final data = (jsonDecode(response)['data'] as List)
        .map((e) => CartModel.fromJason(e))
        .toList();
    return data;
  }

  Future<void> postCart({
    required List<Product> orderItems,
  }) async {
    await BaseApi().postRequest(endPoint: 'carts', data: {
      'order_items': orderItems,
    });
  }
}
