class CropEntity {
  String? name;

  CropEntity({this.name});

  factory CropEntity.fromJson(Map<String, dynamic> json) =>
      CropEntity(name: json["name"] as String?);
}
