import 'package:dio/dio.dart';
import 'package:network/client/client.dart';
import 'package:network/service/network_interface.dart';

class Network implements NetworkInterface {
  final DioClient client;

  Network({required this.client});

  @override
  Future<Response> delete(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    return await client.client.delete(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    return await client.client.get(url, queryParameters: queryParameters);
  }

  @override
  Future post({required String url, Map<String, dynamic>? body}) async {
    return await client.client.post(url, data: body);
  }

  @override
  Future put({required String url, Map<String, dynamic>? body}) async {
    return await client.client.put(url, data: body);
  }
}
