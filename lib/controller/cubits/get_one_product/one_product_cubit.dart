import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/data/model/api/models/product_model.dart';

part 'one_product_state.dart';

class OneProductCubit extends Cubit<OneProductState> {
  OneProductCubit() : super(OneProductInitial());
  void getProduct({required int productId}) async {
    emit(OneProductLoading());
    try {
      final product =
          await ProductServices.getOneProduct(product_id: productId);
      emit(OneProductFetched(product: product));
    } catch (e) {
      emit(OneProductFailure(errorMessage: e.toString()));
    }
  }
}
