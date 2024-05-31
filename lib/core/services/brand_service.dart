import 'dart:convert';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/brand_model.dart';

class BrandService extends BaseApi {
  Future<List<BrandModel>> getAllBrands() async {
    final response = await BaseApi().getRequest(endPoint: 'brands');
    print(response);
    final data = (jsonDecode(response)['data'] as List)
        .map((e) => BrandModel.fromJson(e))
        .toList();
    return data;
  }

  Future<List<BrandModel>> getBrandsOnCategory(
      {required String category}) async {
    final brandResponse = await BaseApi().getRequest(endPoint: 'brands');
    Map<String, dynamic> brandData = jsonDecode(brandResponse)['data'];
    final filteredBrands = brandData['categories']['name']
        .where((brand) => (brand['name']).contains(category))
        .toList();
    print(' $brandData, $filteredBrands');
    return filteredBrands;
  }
}
