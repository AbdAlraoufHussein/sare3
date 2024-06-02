class AuthInfoModel {
  final int id;
  final String name;
  final String phone;
  

  AuthInfoModel({required this.id, required this.name,required this.phone,});

  factory AuthInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthInfoModel(
        id: jsonData['id'],
        name: jsonData['name'],
        phone: jsonData['phone'],
        );
  }
}

class UserInfo {
  final int id;
  final String name;

  UserInfo({required this.id, required this.name});
  factory UserInfo.fromJson(Map<String, dynamic> jsonData) {
    return UserInfo(id: jsonData['id'], name: jsonData['name']);
  }
}
