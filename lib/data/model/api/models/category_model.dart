class CategoryModel {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> jasonData) {
    return CategoryModel(id: jasonData['id'], name: jasonData['name']);
  }
}
