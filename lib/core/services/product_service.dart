import 'dart:convert';
import 'dart:io';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/product_model.dart';

class ProductServices extends BaseApi {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await BaseApi().getRequest(endPoint: 'products');
      print(response);
      return (jsonDecode(response)['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on HttpException catch (e) {
      throw Exception('$e');
    }
  }

  Future<ProductModel> getOneProduct({required int product_id}) async {
    final response =
        await BaseApi().getRequest(endPoint: 'products/$product_id');
    final data = jsonDecode(response)['data'];
    return data;
  }

  Future<List<ProductModel>> getFavoriteProducts() async {
    final response = await BaseApi().getRequest(endPoint: 'products/favorites');
    final data = (jsonDecode(response)['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return data;
  }

  void likeProduct({required int product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/favorite', data: {
      'product_id': product_id,
    });
  }

  void dislikeProduct({required int product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/unfavorite', data: {
      'product_id': product_id,
    });
  }
}
