import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  static String get baseUrl => 'http://127.0.0.1:8000/api/';

  Future<http.Response> getRequest({
    required String endPoint,
  }) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');

    final response = await http.get(Uri.parse(baseUrl + endPoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  Future<http.Response> postRequest(
      {required String endPoint, Map<String, dynamic>? data}) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    final response = await http.post(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  Future<http.Response> putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    final response = await http.put(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  Future<http.Response> deleteRequest({
    required String endPoint,
    required int id,
  }) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');
    final response = await http.delete(
      Uri.parse('$baseUrl$endPoint/$id'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }
}
