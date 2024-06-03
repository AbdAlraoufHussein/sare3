import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/models/brand_model.dart';
import 'package:wael/view/screen/main_page/store.dart';

class SearchModel extends SearchDelegate {
  static List<BrandModel> brandsItems = [];

  static void brands() async {
    final data = await BrandService.getAllBrands();
    for (var d in data) {
      brandsItems.add(d);
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.close,
            color: AppColor.blue,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.keyboard_double_arrow_left_rounded,
          color: AppColor.blue,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    Set<BrandModel> setQuery = {};
    List<BrandModel> matchQuery = setQuery.toList();
    for (var brand in brandsItems) {
      if (brand.name.toLowerCase().contains(query.toLowerCase())) {
        if (!matchQuery.contains(brand)) {
          matchQuery.add(brand);
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.toList().length,
      itemBuilder: (context, index) {
        final result = matchQuery.toList()[index].name;
        return ListTile(
          onTap: () {
            Get.to(() => StorePage(brandId: brandsItems[index].id));
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Set<BrandModel> setQuery = {};
    List<BrandModel> matchQuery = setQuery.toList();
    for (var brand in brandsItems) {
      if (brand.name.toLowerCase().contains(query.toLowerCase())) {
        if (!matchQuery.contains(brand)) {
          matchQuery.add(brand);
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.toList().length,
      itemBuilder: (context, index) {
        final result = matchQuery.toList()[index].name;
        return ListTile(
          onTap: () {
            Get.to(() => StorePage(brandId: brandsItems[index].id));
          },
          title: Text(result),
        );
      },
    );
  }
}
