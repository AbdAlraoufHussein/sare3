import 'package:wael/core/class/base_api_class.dart';

class AuthenticationService extends BaseApi {
  Future<dynamic> signin(String email, String password) async {
    // GET, POST, PUT, DELETE
    final response = await post(
      'login',
      {
        'email': email,
        'password': password,
      },
    );

    print(response.body);
  }
}
