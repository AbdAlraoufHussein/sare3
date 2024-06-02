import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/models/brand_model.dart';

part 'brand_on_category_state.dart';

class BrandOnCategoryCubit extends Cubit<BrandOnCategoryState> {
  BrandOnCategoryCubit() : super(BrandOnCategoryInitial());
  void getBrandOnCategory({required int categoryId}) async {
    emit(BrandOnCategoryLoading());
    try {
      final brandData =
          await BrandService.getBrandOnCategory(categoryId: categoryId);
          emit(BrandOnCategoryFetched(brandData: brandData));
    } catch (e) {
      emit(BrandOnCategoryFailure(errorMessage: e.toString()));
    }
  }
}
