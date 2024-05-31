part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFetched extends ProductState {
  final List<ProductModel> productData;

  ProductFetched({required this.productData});
}

final class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});
}
