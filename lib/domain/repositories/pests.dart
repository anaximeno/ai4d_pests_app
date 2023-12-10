import 'dart:developer';
import 'dart:io';

import 'package:ai4d_pests_app/infra/env.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:ai4d_pests_app/constants/apiroutes.dart';
import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/infra/api.dart';

class PestsRepository {
  final Api _api;
  final Env _env;

  PestsRepository(this._api, this._env);

  Future<PestEntity> getPestBySlug(String slug) async {
    try {
      slug = slug.replaceAll(r' ', '-');

      final response = await _api.get(
        ApiRoutes.pestBySlug(slug),
        cacheOptions: _api.cacheOptions.copyWith(
            policy: CachePolicy.forceCache,
            maxStale: const Nullable(Duration(minutes: 4))),
      );

      return PestEntity.fromJson(response.data as Map<String, dynamic>);
    } on HttpException {
      log("Error sending request to get pest info by slug!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<PestEntity> getPestById(int id) async {
    try {
      final response = await _api.get(
        ApiRoutes.pestById(id),
        cacheOptions: _api.cacheOptions.copyWith(
          policy: CachePolicy.forceCache,
          maxStale: const Nullable(Duration(minutes: 4)),
        ),
      );
      return PestEntity.fromJson(response.data as Map<String, dynamic>);
    } on HttpException {
      log("Error sending request to get pest info by id!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PestEntity>> getAllPests() async {
    try {
      final response = await _api.get(
        ApiRoutes.PESTS,
        cacheOptions: _api.cacheOptions.copyWith(
          policy: CachePolicy.forceCache,
          maxStale: Nullable(Duration(minutes: _env.cacheExpireMinutes)),
        ),
      );

      final data = response.data as List<dynamic>;

      return data
          .map((e) => PestEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    } on HttpException {
      log("Error sending request to get all pests!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updatePestById(int id, PestEntity item) async {
    try {
      final response = await _api.put(
        ApiRoutes.pestById(id),
        body: item.toJson(),
      );
      return response.statusCode == 200;
    } on HttpException {
      log("Error sending request to update pest by id!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deletePestById(int id) async {
    try {
      final response = await _api.delete(ApiRoutes.pestById(id));
      return response.statusCode == 200 || response.statusCode == 404;
    } on HttpException {
      log("Error sending request to delete pest by id!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
