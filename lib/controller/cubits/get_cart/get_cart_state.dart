part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}

final class GetCartLoading extends GetCartState {}

final class GetCartFetched extends GetCartState {
  final List<CartModel> productsCart;

  GetCartFetched({required this.productsCart});
}

final class GetCartFailure extends GetCartState {
  final String errorMessage;

  GetCartFailure({required this.errorMessage});
}
