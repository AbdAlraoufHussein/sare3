class ProductResponse {
  final ProductWithBrand data;

  ProductResponse({required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      data: ProductWithBrand.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class ProductWithBrand {
  final int id;
  final String name;
  final String description;
  final String image;
  final int regularPrice;
  final int salePrice;
  final bool onSale;
  final int discountPercentage;
  final bool isFavoriteForCurrentUser;
  final BrandProduct brand;

  ProductWithBrand({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.discountPercentage,
    required this.isFavoriteForCurrentUser,
    required this.brand,
  });

  factory ProductWithBrand.fromJson(Map<String, dynamic> json) {
    return ProductWithBrand(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      regularPrice: json['regular_price'] as int,
      salePrice: json['sale_price'] as int,
      onSale: json['on_sale'] as bool,
      discountPercentage: json['discount_percentage'] as int,
      isFavoriteForCurrentUser: json['is_favorite_for_current_user'] as bool,
      brand: BrandProduct.fromJson(json['brand'] as Map<String, dynamic>),
    );
  }
}

class BrandProduct {
  final int id;
  final String image;
  final String name;

  BrandProduct({
    required this.id,
    required this.image,
    required this.name,
  });

  factory BrandProduct.fromJson(Map<String, dynamic> json) {
    return BrandProduct(
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
    );
  }
}
