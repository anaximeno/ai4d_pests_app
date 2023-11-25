class ClassificationResultEntity {
  String? label;
  double? prob;

  ClassificationResultEntity({this.label, this.prob});

  factory ClassificationResultEntity.fromJson(Map<String, dynamic> json) =>
      ClassificationResultEntity(
        label: json["label"] as String?,
        prob: json["prob"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "prob": prob,
      };
}
