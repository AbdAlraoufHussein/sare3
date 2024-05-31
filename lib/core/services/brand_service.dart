import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/brand_model.dart';

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

  Future<List<BrandModel>> getBrandsOnCategory(
      {required String category}) async {
    final brandResponse = await BaseApi().getRequest(endPoint: 'brands');
    Map<String, dynamic> brandData = jsonDecode(brandResponse.body)['data'];
    final filteredBrands = brandData['categories']['name']
        .where((brand) => (brand['name']).contains(category))
        .toList();
    print(' $brandData, $filteredBrands');
    return filteredBrands;
  }
}
