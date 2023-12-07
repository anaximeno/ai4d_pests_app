class ControlMethodEntity {
  int? id;
  String? type;
  String? name;
  String? description;

  ControlMethodEntity({
    this.id,
    this.type,
    this.name,
    this.description,
  });

  factory ControlMethodEntity.fromJson(Map<String, dynamic> json) =>
      ControlMethodEntity(
        id: json["id"] as int?,
        type: json["type"] as String?,
        description: json["description"] as String?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'description': description,
      }..removeWhere((key, value) => value == null);
}
