import 'dart:convert';

import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/category_model.dart';

class CategoryServices extends BaseApi {
  Future<List<CategoryModel>> getCategories() async {
    final response = await BaseApi().getRequest(endPoint: 'categories');
    final data = (jsonDecode(response)['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    print(data);
    return data;
  }
}
