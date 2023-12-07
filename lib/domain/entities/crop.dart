class CropEntity {
  int? id;
  String? name;

  CropEntity({this.id, this.name});

  factory CropEntity.fromJson(Map<String, dynamic> json) =>
      CropEntity(id: json["id"] as int?, name: json["name"] as String?);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      }..removeWhere((key, value) => value == null);
}
