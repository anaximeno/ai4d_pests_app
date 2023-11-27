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

      final respoonse = await _api.get("${ApiRoutes.PESTS_SLUGS}/$slug");

      return PestEntity.fromJson(respoonse.data as Map<String, dynamic>);
    } on HttpException {
      log("Error sending request to get classified pest info!");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
