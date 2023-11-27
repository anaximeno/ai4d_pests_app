import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ai4d_pests_app/constants/apiroutes.dart';
import 'package:ai4d_pests_app/domain/entities/classification_request.dart';
import 'package:ai4d_pests_app/domain/entities/classification_response.dart';
import 'package:ai4d_pests_app/infra/api.dart';

class ClassificationRepository {
  final Api _api;

  ClassificationRepository(this._api);

  Future<ClassificationResponseEntity> classify(
    ClassificationRequestEntity item,
  ) async {
    // --- skip ---
    try {
      final response = await _api.post(
        ApiRoutes.CLASSIFICATION,
        body: FormData.fromMap(item.toJson()),
        // headers: {
        //   'Authorization': 'Token 43bee2d65436af4503e86c5fde3357682e5166a3',
        // },
      );

      return ClassificationResponseEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on HttpException {
      log("Http Exception while trying to classify the image");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
