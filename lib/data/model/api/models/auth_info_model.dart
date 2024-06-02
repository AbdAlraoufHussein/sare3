class AuthInfoModel {
  final int id;
  final String phone;
  final String name;

  AuthInfoModel({
    required this.id,
    required this.phone,
    required this.name,
  });

  factory AuthInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthInfoModel(
      id: jsonData['id'],
      phone: jsonData['phone'],
      name: jsonData['name'],
    );
  }
}
