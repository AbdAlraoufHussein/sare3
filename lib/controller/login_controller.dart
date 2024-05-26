import 'package:get/get.dart';
import 'package:wael/core/services/authentication_service.dart';

class SigninController extends GetxController {
  String? email;
  String? password;

  void logIN() {
    AuthenticationService.logIN(email: email!,password: password!);
  }
}
