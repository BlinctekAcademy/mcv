import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      log('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
      log('BODY---------------------------------');
      log(response.data.toString());
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode)
      log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
    return super.onError(err, handler);
  }
}
