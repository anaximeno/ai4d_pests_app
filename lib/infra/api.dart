import 'package:dio/dio.dart' as dio;

import 'env.dart';

class Api {
  final Env _env;
  final dio.Dio _dio;

  Api(this._env) : _dio = dio.Dio();

  // NOTE: the reason to retrieve it this ways instead of definig an attribute
  // its because the env configs are loaded after the construction of the object
  // of this class.
  Map<String, dynamic> get defaultApiHeaders => {
        'Authorization': 'Token ${_env.apiAccessToken}',
      };

  String parseRoute(String route) => "${_env.apiAddress}$route";

  Future<dio.Response> post(String route,
      {required Object body, Map<String, String>? headers}) {
    // --- skip ---
    return _dio.post(
      parseRoute(route),
      data: body,
      options: dio.Options(
        headers: {...defaultApiHeaders, ...?headers},
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
      options: dio.Options(headers: {...defaultApiHeaders, ...?headers}),
    );
  }

  Future<dio.Response> put(String route,
      {required Object body, Map<String, String>? headers}) {
    // --- skip ---
    return _dio.put(
      parseRoute(route),
      data: body,
      options: dio.Options(headers: {...defaultApiHeaders, ...?headers}),
    );
  }

  Future<dio.Response> delete(String route, {Map<String, String>? headers}) {
    return _dio.delete(
      parseRoute(route),
      options: dio.Options(headers: {...defaultApiHeaders, ...?headers}),
    );
  }
}
