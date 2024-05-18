import 'package:wael/core/class/base_api_class.dart';
import 'package:wael/data/model/api/brand.dart';

class BrandService extends BaseApi {
  Future<List<Brand>> getAll() async {
    // GET, POST, PUT, DELETE
    final response = await dio.get(
      'brands?populate=Image',
    );

    final Map<String, dynamic> data = response.data;
    return (data['data'] as List).map((e) => Brand.fromJson(e)).toList();
  }
}
