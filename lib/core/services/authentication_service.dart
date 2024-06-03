import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/auth_info_model.dart';

class AuthenticationService extends BaseApi {
  static Future<String?> logIN(
      {required String email, required String password}) async {
    // GET, POST, PUT, DELETE
    final response = await BaseApi().postRequest(
      endPoint: 'login',
      data: {
        'email': email,
        'password': password,
      },
    );
    final String token = jsonDecode(response.body)['token'] as String;
    final sharedPrefs = await SharedPreferences.getInstance();
    final errorMessage = jsonDecode(response.body)['message'];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await sharedPrefs.setString('token', token);
      print(token);
      return null;
    } else {
      return errorMessage;
    }
  }

  static Future<String?> signup({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    final response = await BaseApi().postRequest(
      endPoint: 'register',
      data: {
        'name': username,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    final token = jsonDecode(response.body)['token'];
    final errorMessage = jsonDecode(response.body)['message'];
    final sharedPrefs = await SharedPreferences.getInstance();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await sharedPrefs.setString('token', token);
      print(token);
      return null;
    } else {
      return errorMessage;
    }
  }

  static Future<void> logOut() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final response = await BaseApi().postRequest(
      endPoint: 'logout',
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await sharedPrefs.remove('token');
    }
  }

  static Future<AuthInfoModel> getUserInfo() async {
    final response = await BaseApi().getRequest(endPoint: 'user');
    final data = AuthInfoModel.fromJson(jsonDecode(response.body)['data']);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      return data;
    }
    throw Exception('There is no data');
  }

  static Future<String?> updateUserInfo(
      {required String name, required String phone}) async {
    final response = await BaseApi().putRequest(endPoint: 'user', data: {
      'name': name,
      'phone': phone,
    });
    return 'Status code: ${response.statusCode}, body: ${response.body}';
  }
}
