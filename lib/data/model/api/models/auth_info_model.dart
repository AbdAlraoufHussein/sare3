class AuthInfoModel {
  final String phone;
  final String name;

  AuthInfoModel({
    required this.phone,
    required this.name,
  });

  factory AuthInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthInfoModel(
      phone: jsonData['phone'],
      name: jsonData['name'],
    );
  }
}
