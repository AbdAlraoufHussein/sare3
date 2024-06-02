import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/data/model/api/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  void getProducts() async {
    emit(ProductLoading());
    try {
      final productData = await ProductServices.getAllProducts();
      emit(ProductFetched(productData: productData));
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }

  void getFavoriteProduct() async {
    emit(ProductLoading());
    try {
      final productData = await ProductServices.getFavoriteProducts();
      emit(ProductFetched(productData: productData));
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }

  void getBiggestDiscountProduct() async {
    emit(ProductLoading());
    try {
      final productData = await ProductServices.getAllProducts();
      final productDiscountData = productData
          .where((element) => element.discount_percentage >= 50)
          .toList();
      emit(ProductFetched(productData: productDiscountData));
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }

  void getBrandProduct({required int brandId}) async {
    emit(ProductLoading());
    try {
      final productData =
          await ProductServices.getBrandProduct(brandId: brandId);
      emit(ProductFetched(productData: productData));
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }
}
