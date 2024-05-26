class AuthInfoModel {
  final String name;
  final String email;
  final String password;
  final String phone;

  AuthInfoModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  factory AuthInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthInfoModel(
        name: jsonData['name'],
        email: jsonData['email'],
        password: jsonData['password'],
        phone: jsonData['phone']);
  }
}
