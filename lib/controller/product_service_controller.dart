import 'package:get/get.dart';
import 'package:wael/core/services/product_service.dart';
import 'package:wael/data/model/api/models/product_model.dart';

class ProductServiceController extends GetxController {
  bool isAllProductsLoading = true;
  bool isOneProductLoading = true;
  bool isFavoriteProductsLoading = true;
  int productsListLength = 0;
  int favoriteProductsListLength = 0;

  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductModel> allProductsData =
        await ProductServices.getAllProducts();
    isAllProductsLoading == false;
    favoriteProductsListLength = allProductsData.length;
    return allProductsData;
  }

  Future<ProductModel> fetchOneProduct({required int product_id}) async {
    final ProductModel allProductsData =
        await ProductServices.getOneProduct(product_id: product_id);
    isOneProductLoading == false;
    return allProductsData;
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    final List<ProductModel> allProductsData =
        await ProductServices.getFavoriteProducts();
    isFavoriteProductsLoading == false;
    productsListLength = allProductsData.length;
    return allProductsData.toList();
  }
}
