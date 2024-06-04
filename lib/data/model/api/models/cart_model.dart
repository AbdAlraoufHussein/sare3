import 'package:wael/data/model/api/models/product_model.dart';

class ApiResponse {
  final CartModel data;

  ApiResponse({required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class CartModel {
  final int id;
  final ProductModel product;
  int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final int regularPrice;
  final int salePrice;
  final bool onSale;
  final double discountPercentage;
  final bool isFavoriteForCurrentUser;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      regularPrice: json['regular_price'] as int,
      salePrice: json['sale_price'] as int,
      onSale: json['on_sale'] as bool,
      discountPercentage: (json['discount_percentage'] as num).toDouble(),
      isFavoriteForCurrentUser: json['is_favorite_for_current_user'] as bool,
    );
  }
}
