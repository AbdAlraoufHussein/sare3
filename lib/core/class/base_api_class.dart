import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  static String get domain => 'https://611e-46-213-205-56.ngrok-free.app';

  static String get baseUrl => '$domain/api/';

    static const Map<String, String> ngrokHeaders = {
    "ngrok-skip-browser-warning": "69420"
  };

  final dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer 05afeb775dd3028e0db05bdf6df8d33651bfdab734a8ce3a89eaf1e6a0d31c19f57e94509f19de3336fe67b28b6b1a7365d59d3d40f4cbb01a3c1af87132e7cf724bc4757c6c02b95d55b61f1947edbde8b5a8414649a2eb52de180594aedb1762a7b7b302007e68885d1537bfe31ed7b44aead95f10772b09655a06da6a64b2',
          ...ngrokHeaders,
    }),
  )..interceptors.add(PrettyDioLogger());
}
