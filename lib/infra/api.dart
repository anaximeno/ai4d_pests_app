import 'package:dio/dio.dart' as dio;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'env.dart';

const DEFAULT_CACHE_EXPIRE_MINUTES = 5;

class Api {
  final Env _env;

  late final CacheOptions cacheOptions;

  late final dio.Dio _dio;

  Api(this._env) {
    cacheOptions = CacheOptions(
      store: MemCacheStore(),
      hitCacheOnErrorExcept: [
        401,
        403,
        400,
        500,
      ],
      allowPostMethod: false,
      policy: CachePolicy.refresh,
      maxStale: const Duration(minutes: 5),
    );

    _dio = dio.Dio()
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

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

  Future<dio.Response> get(
    String route, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    CacheOptions? cacheOptions,
  }) {
    // --- skip ---

    dio.Options? options;

    if (cacheOptions != null) {
      options = cacheOptions.toOptions()
        ..headers = {
          ...defaultApiHeaders,
          ...?cacheOptions.toOptions().headers,
          ...?headers,
        };
    } else {
      options = dio.Options(
        headers: {...defaultApiHeaders, ...?headers},
      );
    }

    return _dio.get(
      parseRoute(route),
      queryParameters: params,
      options: options,
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
