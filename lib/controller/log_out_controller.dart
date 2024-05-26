import 'package:get/get.dart';
import 'package:wael/core/services/authentication_service.dart';

class LogOutController extends GetxController {
  void logOut() {
    AuthenticationService.logOut();
  }
}
