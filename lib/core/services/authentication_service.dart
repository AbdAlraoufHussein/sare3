import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/auth_info_model.dart';
import 'package:wael/data/model/api/models/profile_model.dart';

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
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await sharedPrefs.setString('token', token);
      print(token);
      return null;
    }
    print(response.statusCode);
    return jsonDecode(response.body)['message'];
  }

  static Future<String?> signup({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
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
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString('token', token);
      return null;
    } on HttpException catch (e) {
      final errorMeaasge = jsonDecode(response.body)['token'];

      return 'Error : ${e.toString()}';
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

  static Future<ProfileModel?> getUserInfo() async {
    try {
      final response = await BaseApi().getRequest(endPoint: 'user');
      print("Response: $response"); // Print the full response for debugging

      final data = jsonDecode(response);

      // **Improved data validation:**
      if (data == null) {
        print("Data is null");
        throw Exception(
            'Error: Received null data from API'); // Throw a specific exception
      } else if (!(data['data'] is List)) {
        print("data['data'] is not a List");
        throw Exception(
            'Error: Unexpected data format. Expected a List in the "data" key.');
      } else if (data['data'].isEmpty) {
        print("data['data'] is empty");
        return null; // No user data found, return null
      }

      // **User data extraction:**
      final user = data['data'][0]; // Assuming the first element is the user

      // **Error handling during ProfileModel conversion (if applicable):**
      try {
        final profileModel = ProfileModel.fromJson(user);
        print("Successfully retrieved user profile");
        return profileModel;
      } on Exception catch (e) {
        print("Error converting user data to ProfileModel: $e");
        throw Exception(
            'Error: Failed to create ProfileModel from user data.'); // Throw a specific exception
      }
    } on Exception catch (e) {
      print("Exception during API call: $e");
      throw Exception(
          'Error: Failed to retrieve user info.'); // Throw a generic exception for unhandled errors
    }
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
