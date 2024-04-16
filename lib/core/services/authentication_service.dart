import 'package:wael/core/class/base_api_class.dart';

class AuthenticationService extends BaseApi {
  Future<int> signin(String email, String password) async {
    // GET, POST, PUT, DELETE
    final response = await dio.post(
      'auth/local',
      data: {
        'identifier': email,
        'password': password,
      },
    );

    final Map<String, dynamic> data = response.data;
    return data['user']['id'] as int;
  }

    Future<int> signup(String email, String password) async {
    // GET, POST, PUT, DELETE
    final response = await dio.post(
      'auth/local',
      data: {
        'username':email,
        'email': email,
        'password': password,
      },
    );

    final Map<String, dynamic> data = response.data;
    return data['user']['id'] as int;
  }

  


}
