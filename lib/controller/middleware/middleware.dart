import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/functions/middleware_prefs.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = MiddleWarePrefs.getToken();
    if (token == null) return const RouteSettings(name: AppRoute.splashScreen);
    return const RouteSettings(name: AppRoute.mainPage);
  }
}
