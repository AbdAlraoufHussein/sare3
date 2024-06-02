import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/product_model.dart';

abstract class ProductServices extends BaseApi {
  static Future<List<ProductModel>> getAllProducts() async {
    final response = await BaseApi().getRequest(endPoint: 'products');
    print(response.body);
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }
    throw Exception('Something went wrong');
  }

  static Future<ProductModel> getOneProduct({required int product_id}) async {
    final response =
        await BaseApi().getRequest(endPoint: 'products/$product_id');
    final data = jsonDecode(response.body)['data'];
    return data;
  }

  static Future<List<ProductModel>> getFavoriteProducts() async {
    final response = await BaseApi().getRequest(endPoint: 'products');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .where((element) => element.is_favorite_for_current_user == true)
        .toList();
    return data;
  }

  static void likeProduct({required String product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/favorite', data: {
      'product_id': product_id,
    });
  }

  static void dislikeProduct({required String product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/unfavorite', data: {
      'product_id': product_id,
    });
  }

  static Future<List<ProductModel>> getBrandProduct(
      {required int brandId}) async {
    final response = await BaseApi().getRequest(endPoint: 'brand/$brandId/product');
    final products = (jsonDecode(response.body)['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    print(products);
    return products;
  }
}
