import 'dart:convert';

import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/banner_model.dart';

class BannerService extends BaseApi {
  Future<List<BannerModel>> getAll() async {
    // GET, POST, PUT, DELETE
    final response = await BaseApi().getRequest(endPoint: 'banners');
    final data = (jsonDecode(response)['data'] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
    return data;
  }
}
