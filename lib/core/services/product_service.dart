import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductServices extends BaseApi {
  static Future<List<ProductModel>> getAllProducts() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/products'), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
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
    final response = await BaseApi().getRequest(endPoint: 'products/favorites');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return data;
  }

  static void likeProduct({required int product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/favorite', data: {
      'product_id': product_id,
    });
  }

  static void dislikeProduct({required int product_id}) async {
    await BaseApi()
        .postRequest(endPoint: 'products/$product_id/unfavorite', data: {
      'product_id': product_id,
    });
  }
}
