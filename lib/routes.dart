import 'package:flutter/material.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/screen/auth/Signin.dart';
import 'package:wael/view/screen/auth/Signup.dart';
import 'package:wael/view/screen/cart_page.dart';
import 'package:wael/view/screen/categories_page.dart';
import 'package:wael/view/screen/favorite_page.dart';
import 'package:wael/view/screen/home_page.dart';
import 'package:wael/view/screen/language.dart';
import 'package:wael/view/screen/main_page.dart';
import 'package:wael/view/screen/notifications.dart';
import 'package:wael/view/screen/onboarding.dart';
import 'package:wael/view/screen/profile_page.dart';
import 'package:wael/view/screen/store.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.signIn: (context) => const SignIn(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.chooselang: (context) => const Language(),
  AppRoute.onBoarding: (context) => const OnBoarding(),

  AppRoute.favoritePage: (context) => const FavoratePage(),
  AppRoute.notifications: (context) => const Notifications(),
  AppRoute.storePage: (context) => const StorePage(),
  AppRoute.mainPage: (context) => const MainPage(),
    AppRoute.homePage: (context) => const HomePage(),

  AppRoute.cateroriesPage: (context) => const CategoriesPage(),

  AppRoute.cartPage: (context) => const CartPage(),

  AppRoute.profilePage: (context) => const ProfilePage(),


};
