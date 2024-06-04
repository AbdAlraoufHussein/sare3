import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/cart_service.dart';
import 'package:wael/data/model/api/models/cart_model.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit() : super(GetCartInitial());
  void getCrts() async {
    emit(GetCartLoading());
    try {
      final cartData = await CartServices.getCart();
      emit(GetCartFetched(productsCart: cartData));
    } on HttpException catch (e) {
      emit(GetCartFailure(errorMessage: e.message));
    }
  }
}
