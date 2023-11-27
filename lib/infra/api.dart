import 'package:dio/dio.dart' as dio;

class Api {
  // TODO: handle auth
  final String baseURL;

  final _dio = dio.Dio();

  Api({this.baseURL = "http://127.0.0.1:8000/api"});

  String parseRoute(String route) => "$baseURL$route";

  Future<dio.Response> post(String route,
      {required Object body, Map<String, String>? headers}) {
    // --- skip ---
    return _dio.post(
      parseRoute(route),
      data: body,
      options: dio.Options(
        headers: headers,
        responseType: dio.ResponseType.json,
      ),
    );
  }

  Future<dio.Response> get(String route,
      {Map<String, dynamic>? params, Map<String, String>? headers}) {
    // --- skip ---
    return _dio.get(
      parseRoute(route),
      queryParameters: params,
      options: dio.Options(headers: headers),
    );
  }

  Future<dio.Response> put(String route,
      {required Object body, Map<String, String>? headers}) {
    // --- skip ---
    return _dio.put(
      parseRoute(route),
      data: body,
      options: dio.Options(headers: headers),
    );
  }

  Future<dio.Response> delete(String route, {Map<String, String>? headers}) {
    return _dio.delete(
      parseRoute(route),
      options: dio.Options(headers: headers),
    );
  }
}
