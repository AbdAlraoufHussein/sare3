import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/services/authentication_service.dart';

abstract class SignupController extends GetxController {
  void signin();

  final AuthenticationService authenticationService = AuthenticationService();
}

class SignupControllerImplement extends SignupController {
  String? email;
  String? password;

  @override
  void signin() async {
    if (email case final email?) {
      if (password case final password?) {
        try {
          final userId = await authenticationService.signin(email, password);

          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          await sharedPreferences.setInt('userId', userId);
          Get.toNamed(AppRoute.homePage);
        } on DioException catch (e) {
          await Get.dialog(const AlertDialog(
            title: Text('Error'),
            content: Text('Email or password is wrong'),
          ));
        }
      }
    }
  }
}
