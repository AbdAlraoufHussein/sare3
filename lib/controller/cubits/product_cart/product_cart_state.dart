part of 'product_cart_cubit.dart';

@immutable
sealed class ProductCartState {}

final class ProductCartInitial extends ProductCartState {}
final class ProductCartloading extends ProductCartState {}
final class ProductCartFetched extends ProductCartState {
  final List<ProductModel> productCart;

  ProductCartFetched({required this.productCart});
}
final class ProductCartFailure extends ProductCartState {
  final String errorMessage;

  ProductCartFailure({required this.errorMessage});
}
