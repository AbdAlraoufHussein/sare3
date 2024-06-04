part of 'brand_with_products_cubit.dart';

@immutable
sealed class BrandWithProductsState {}

final class BrandWithProductsInitial extends BrandWithProductsState {}
final class BrandWithProductsLoading extends BrandWithProductsState {}
final class BrandWithProductsFetched extends BrandWithProductsState {
  final BrandProductModel brandWithProduct;

  BrandWithProductsFetched({required this.brandWithProduct});
}
final class BrandWithProductsFailure extends BrandWithProductsState {
  final String errorMessage;

  BrandWithProductsFailure({required this.errorMessage});
}
