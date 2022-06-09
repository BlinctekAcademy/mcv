import 'package:common/common.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio _client;
  late BaseOptions _baseOptions;

  DioClient({BaseOptions? baseOptions}) {
    _baseOptions = baseOptions ??
        BaseOptions(
            baseUrl: API.baseUrl + API.version,
            connectTimeout: API.connectTimeout,
            receiveTimeout: API.receiveTimeout,
            contentType: API.contentType);

    _client = Dio(_baseOptions);
  }

  BaseOptions get baseOptions => _baseOptions;

  Dio get client => _client;

  void addInterceptors(List<Interceptor> interceptors) {
    _client.interceptors.addAll(interceptors);
  }
}
