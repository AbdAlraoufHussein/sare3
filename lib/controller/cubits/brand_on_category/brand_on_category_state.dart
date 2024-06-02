part of 'brand_on_category_cubit.dart';

@immutable
sealed class BrandOnCategoryState {}

final class BrandOnCategoryInitial extends BrandOnCategoryState {}
final class BrandOnCategoryLoading extends BrandOnCategoryState {}
final class BrandOnCategoryFetched extends BrandOnCategoryState {
  final List<BrandModel> brandData;

  BrandOnCategoryFetched({required this.brandData});
}
final class BrandOnCategoryFailure extends BrandOnCategoryState {
  final String errorMessage;

  BrandOnCategoryFailure({required this.errorMessage});
}
