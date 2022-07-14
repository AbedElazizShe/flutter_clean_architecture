import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiService {
  @singleton
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = GetIt.instance.get<String>(instanceName: 'endpoint');
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log('REQUEST[${options.method}] => PATH: ${options.path}');
    developer.log('REQUEST[${options.toString()}]');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    developer.log('RESPONSE[${response.toString()}]');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    developer.log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    developer.log('ERROR[${err.response?.toString()}]');
    return super.onError(err, handler);
  }
}
