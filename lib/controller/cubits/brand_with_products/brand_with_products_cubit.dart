import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/models/brand_product_model.dart';

part 'brand_with_products_state.dart';

class BrandWithProductsCubit extends Cubit<BrandWithProductsState> {
  BrandWithProductsCubit() : super(BrandWithProductsInitial());
  void getBrandWithProducts({required int brandId}) async {
    try {
      emit(BrandWithProductsLoading());
      final brandWithProduct =
          await BrandService.getOneBrandWithProduct(brandId: brandId);
      emit(BrandWithProductsFetched(brandWithProduct: brandWithProduct));
    } on HttpException catch (e) {
      BrandWithProductsFailure(errorMessage: e.message);
    }
  }
}
