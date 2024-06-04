part of 'one_product_cubit.dart';

@immutable
sealed class OneProductState {}

final class OneProductInitial extends OneProductState {}
final class OneProductLoading extends OneProductState {}
final class OneProductFetched extends OneProductState {
  final ProductWithBrand product;

  OneProductFetched({required this.product});
}
final class OneProductFailure extends OneProductState {
  final String errorMessage;

  OneProductFailure({required this.errorMessage});
}
