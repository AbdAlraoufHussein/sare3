class ApiResponse {
  final BrandProductModel data;

  ApiResponse({required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: BrandProductModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class BrandProductModel {
  final int id;
  final String image;
  final String name;
  final String address;
  final String telephone;
  final String phone;
  final String description;
  final List<String> categories; // This is now a List<String>
  final List<ProductBrand> products;

  BrandProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.address,
    required this.telephone,
    required this.phone,
    required this.description,
    required this.categories, // Changed to List<String>
    required this.products,
  });

  factory BrandProductModel.fromJson(Map<String, dynamic> json) {
    List<String> categoryNames = (json['categories'] as List<dynamic>)
        .map((e) => e['name'] as String)
        .toList(); // Convert into List<String>

    return BrandProductModel(
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      telephone: json['telephone'] as String,
      phone: json['phone'] as String,
      description: json['description'] as String,
      categories: categoryNames, // Use the extracted List<String>
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductBrand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ProductBrand {
  final int id;
  final String name;
  final String description;
  final String image;
  final int regularPrice;
  final int salePrice;
  final bool onSale;
  final int discountPercentage;
  bool isFavoriteForCurrentUser;

  ProductBrand({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.discountPercentage,
    required this.isFavoriteForCurrentUser,
  });

  factory ProductBrand.fromJson(Map<String, dynamic> json) {
    return ProductBrand(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      regularPrice: json['regular_price'] as int,
      salePrice: json['sale_price'] as int,
      onSale: json['on_sale'] as bool,
      discountPercentage: json['discount_percentage'] as int,
      isFavoriteForCurrentUser: json['is_favorite_for_current_user'] as bool,
    );
  }
}
