abstract class IApiClient {
  Future<dynamic> get(String path, Map<dynamic, dynamic>? params);
  Future<dynamic> post(String path, Map<dynamic, dynamic>? params);
  Future<dynamic> deleteWithBody(String path, Map<dynamic, dynamic>? params);
  Future<dynamic> getPath(String path, Map<dynamic, dynamic>? params);
}
