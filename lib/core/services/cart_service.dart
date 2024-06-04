import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/cart_model.dart';

abstract class CartServices extends BaseApi {
  static Future<List<CartModel>> getCart() async {
    final response = await BaseApi().getRequest(endPoint: 'carts');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => CartModel.fromJson(e))
        .toList();
    return data;
  }

  static Future<CartModel> postCart({
    required String product_id,
    required String quantity,
  }) async {
    final response = await BaseApi().postRequest(endPoint: 'carts', data: {
      'product_id': product_id,
      'quantity': quantity,
    });
    return CartModel.fromJson(jsonDecode(response.body)['data']);
  }

  static Future<void> putCart({
    required String cartId,
    required String productId,
    required String quantity,
  }) async {
    await BaseApi().putRequest(endPoint: 'carts/$cartId', data: {
      'product_id': productId,
      'quantity': quantity,
    });
  }

  static Future<void> deleteCart({
    required int cartId,
  }) async {
    await BaseApi().deleteRequest(endPoint: 'carts', id: cartId);
  }

  static Future<void> postorder() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    await BaseApi().postRequest(endPoint: 'orders', data: {
      'token': token,
    });
  }
}
