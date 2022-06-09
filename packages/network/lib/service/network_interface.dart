abstract class NetworkInterface<R> {
  Future<R> get({required String url, Map<String, dynamic>? queryParameters});
  Future<R> post({required String url, Map<String, dynamic>? body});
  Future<R> put({required String url, Map<String, dynamic>? body});
  Future<R> delete(
      {required String url, Map<String, dynamic>? queryParameters});
}
