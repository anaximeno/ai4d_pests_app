import 'classification_result.dart';

class ClassificationOutputEntity {
  ClassificationResultEntity? result;
  List<ClassificationResultEntity>? all;

  ClassificationOutputEntity({this.result, this.all});

  factory ClassificationOutputEntity.fromJson(Map<String, dynamic> json) =>
      ClassificationOutputEntity(
        result: json["result"] != null
            ? ClassificationResultEntity.fromJson(json["result"])
            : null,
        all: json["all"] != null
            ? (json["all"] as List<dynamic>?)
                ?.map(
                  (e) => ClassificationResultEntity.fromJson(e),
                )
                .toList()
            : null,
      );
}
