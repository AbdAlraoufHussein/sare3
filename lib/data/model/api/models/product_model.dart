class ProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final int regular_price;
  final int sale_price;
  final bool on_sale;
  final double discount_percentage;
  bool is_favorite_for_current_user;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.regular_price,
      required this.sale_price,
      required this.on_sale,
      required this.discount_percentage,
      required this.is_favorite_for_current_user});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      image: jsonData['image'],
      regular_price: jsonData['regular_price'],
      sale_price: jsonData['sale_price'],
      on_sale: jsonData['on_sale'],
      discount_percentage: jsonData['discount_percentage'],
      is_favorite_for_current_user: jsonData['is_favorite_for_current_user'],
    );
  }
}
