// For API connection : Step 2

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/api_endpoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_error_interceptor.dart';

final httpServiceProvider = Provider<Dio>(
  (ref) => HttpService(Dio()).dio,
);

class HttpService {
  final Dio _dio;

  Dio get dio => _dio;

  HttpService(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      // DioErrorInterceptor ==> is used to handle the server errors
      ..interceptors.add(DioErrorInterceptor())
      // this PrettyDioLogger prints the response that come from API.
      // Note: do only for development environment or deployment we handle this using if else statement
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true))
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
  }
}
