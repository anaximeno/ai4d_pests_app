import 'dart:developer';
import 'dart:io';

import 'package:ai4d_pests_app/constants/apiroutes.dart';
import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/infra/api.dart';

class PestsRepository {
  final Api _api;

  PestsRepository(this._api);

  Future<PestEntity> getPestBySlug(String slug) async {
    try {
      slug = slug.replaceAll(r' ', '-');

      final respoonse = await _api.get(ApiRoutes.pestBySlug(slug));

      return PestEntity.fromJson(respoonse.data as Map<String, dynamic>);
    } on HttpException {
      log("Error sending request to get pest info by slug!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<PestEntity> getPestById(int id) async {
    try {
      final respoonse = await _api.get(ApiRoutes.pestById(id));
      return PestEntity.fromJson(respoonse.data as Map<String, dynamic>);
    } on HttpException {
      log("Error sending request to get pest info by id!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PestEntity>> getAllPests() async {
    try {
      final response = await _api.get(ApiRoutes.PESTS);
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
