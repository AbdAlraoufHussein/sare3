import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/data/model/api/models/product_model.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  ProductCartCubit() : super(ProductCartInitial());
  final List<ProductModel> productCartlist = [];
  void addProductToCart({required ProductModel product}) {
    productCartlist.add(product);
    print(productCartlist);
  }

  void removeProductFromCart(
      {required ProductModel product, required int quantity}) {
    for (int i = 0; i < quantity; i++) {
      productCartlist.add(product);
    }
  }

  void getCartItems() {
    emit(ProductCartloading());
    try {
      emit(ProductCartFetched(productCart: productCartlist));
    } catch (e) {
      emit(ProductCartFailure(errorMessage: e.toString()));
    }
  }
}
