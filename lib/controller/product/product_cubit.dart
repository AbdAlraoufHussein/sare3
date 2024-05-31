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
}
