import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/data/model/api/models/product_with_brand_mode.dart';

part 'one_product_state.dart';

class OneProductCubit extends Cubit<OneProductState> {
  OneProductCubit() : super(OneProductInitial());
  void getProduct({required int productId}) async {
    emit(OneProductLoading());
    try {
      final product =
          await ProductServices.getProductWithBrand(productId: productId);
      emit(OneProductFetched(product: product));
    }on HttpException catch (e) {
      emit(OneProductFailure(errorMessage: e.toString()));
    }
  }
}
