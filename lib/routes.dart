import 'package:flutter/material.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/screen/auth/Signin.dart';
import 'package:wael/view/screen/auth/Signup.dart';
import 'package:wael/view/screen/language.dart';
import 'package:wael/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.signIn: (context) => const SignIn(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.chooselang: (context) => const Language(),
  AppRoute.onBoarding: (context) => const OnBoarding(),
};
