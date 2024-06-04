import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/brand_model.dart';
import 'package:wael/data/model/api/models/brand_product_model.dart';

class BrandService extends BaseApi {
  static Future<List<BrandModel>> getAllBrands() async {
    final response = await BaseApi().getRequest(endPoint: 'brands');
    final data = (jsonDecode(response.body)['data'] as List)
        .map((e) => BrandModel.fromJson(e))
        .toList();
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }
    throw Exception('No Brand');
  }

  static Future<List<BrandModel>> getBrandOnCategory(
      {required int categoryId}) async {
    final resposne =
        await BaseApi().getRequest(endPoint: 'category/$categoryId/brand');
    final data = (jsonDecode(resposne.body)['data'] as List)
        .map((e) => BrandModel.fromJson(e))
        .toList();
    print(data);
    return data;
  }

  static Future<BrandProductModel> getOneBrandWithProduct(
      {required int brandId}) async {
    final response = await BaseApi().getRequest(endPoint: 'brands/$brandId');
    final data = BrandProductModel.fromJson(jsonDecode(response.body)['data']);
    return data;
  }
}
