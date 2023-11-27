import 'classification_output.dart';

class ClassificationResponseEntity {
  String? modelName;
  ClassificationOutputEntity? output;
  double? probSum;

  ClassificationResponseEntity({this.modelName, this.output, this.probSum});

  factory ClassificationResponseEntity.fromJson(Map<String, dynamic> json) =>
      ClassificationResponseEntity(
        modelName: json["model"] as String?,
        output: json["output"] != null
            ? ClassificationOutputEntity.fromJson(json["output"])
            : null,
        probSum: json["prob_sum"] as double?,
      );
}
