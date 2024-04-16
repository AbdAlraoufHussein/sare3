import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  static String get baseUrl => 'http://localhost:1337/api/';

  final dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    }),
  )..interceptors.add(PrettyDioLogger());
}
