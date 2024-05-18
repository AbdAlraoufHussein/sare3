import 'package:wael/core/class/base_api_class.dart';
import 'package:wael/data/model/api/banner.dart';

class BannerService extends BaseApi {
  Future<List<Banner>> getAll() async {
    // GET, POST, PUT, DELETE
    final response = await dio.get(
      'banners?populate=Image',
    );

    final Map<String, dynamic> data = response.data;
    return (data['data'] as List).map((e) => Banner.fromJson(e)).toList();
  }
}
