import 'package:get/get.dart';

class BaseApi extends GetConnect {
  static String get _baseUrl => 'https://2dfb-2605-6440-4015-7000-ef53-42d4-ec7b-4eca.ngrok-free.app/';

  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    super.onInit();
  }
}
