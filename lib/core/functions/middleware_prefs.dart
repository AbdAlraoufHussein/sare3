import 'package:shared_preferences/shared_preferences.dart';

abstract class MiddleWarePrefs{

  static Future<String> getToken()async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token').toString();
    return token;
  }

}