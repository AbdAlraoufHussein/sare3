import 'package:get/get.dart';
import 'package:wael/core/services/authentication_service.dart';

class SignUpController extends GetxController {
  String? name;
  String? email;
  String? password;
  String? phone;

  void signUp() async {
    AuthenticationService.signup(
        username: name!, email: email!, password: password!, phone: phone!);
  }
}
