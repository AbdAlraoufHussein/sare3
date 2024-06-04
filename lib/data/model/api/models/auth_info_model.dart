// class AuthInfoModel {
//   final int id;
//   final String phone;
//   final String name;
//   final UserInfo user;

//   AuthInfoModel({
//     required this.id,
//     required this.phone,
//     required this.name,
//     required this.user,
//   });

//   factory AuthInfoModel.fromJson(Map<String, dynamic> jsonData) {
//     return AuthInfoModel(
//       id: jsonData['id'],
//       phone: jsonData['phone'],
//       name: jsonData['user']['name'],
//       user: UserInfo.fromJson(jsonData['user']),
//     );
//   }
// }

// class UserInfo {
//   final int id;
//   final String name;
//   final String email;
//   final String email_verified_at;
//   final String created_at;
//   final String updated_at;

//   UserInfo(
//       {required this.id,
//       required this.name,
//       required this.email,
//       required this.email_verified_at,
//       required this.created_at,
//       required this.updated_at});

//   factory UserInfo.fromJson(Map<String, dynamic> jsonData) {
//     return UserInfo(
//         id: jsonData['id'],
//         name: jsonData['name'],
//         email: jsonData['email'],
//         email_verified_at: jsonData['email_verified_at'],
//         created_at: jsonData['created_at'],
//         updated_at: jsonData['updated_at']);
//   }
// }

class ResponseData {
  final AuthInfoModel data;

  ResponseData({required this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      data: AuthInfoModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AuthInfoModel {
  final int id;
  final String phone;
  final User user;

  AuthInfoModel({required this.id, required this.phone, required this.user});

  factory AuthInfoModel.fromJson(Map<String, dynamic> json) {
    return AuthInfoModel(
      id: json['id'],
      phone: json['phone'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}