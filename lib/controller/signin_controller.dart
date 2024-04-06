import 'package:get/get.dart';
import 'package:wael/core/services/authentication_service.dart';

abstract class SigninController extends GetxController {
  void signin();

  final AuthenticationService authenticationService = AuthenticationService();
}

class SigninControllerImplement extends SigninController {
  String? email;
  String? password;
  
  @override
  void signin() async {
    if (email case final email?) {
      if (password case final password?) {
        final  data = await authenticationService.signin(email, password);
      }
    }
  }
}
