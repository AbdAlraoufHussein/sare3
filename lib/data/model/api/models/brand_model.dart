class BrandModel {
  final int id;
  final String image;
  final String name;
  final String address;
  final String telephone;
  final String phone;
  final String description;
  final List categories;
  final List products;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.address,
      required this.telephone,
      required this.phone,
      required this.description,
      required this.categories,
      required this.products});

  factory BrandModel.fromJson(Map<String, dynamic> jsonData) {
    return BrandModel(
        id: jsonData['id'],
        image: jsonData['image'],
        name: jsonData['name'],
        address: jsonData['address'],
        telephone: jsonData['telephone'],
        phone: jsonData['phone'],
        description: jsonData['description'],
        categories: jsonData['categories'],
        products: jsonData['products']);
  }
}
