import 'package:shared_preferences/shared_preferences.dart';

abstract class MiddleWarePrefs {
  static SharedPreferences? sharedPrefs;
  static Future<String?>? getToken() async {
    sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs!.getString('token');
    return token;
  }
}
