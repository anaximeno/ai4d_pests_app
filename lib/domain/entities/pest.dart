import 'package:ai4d_pests_app/domain/entities/control_method.dart';
import 'package:ai4d_pests_app/domain/entities/crop.dart';

class PestEntity {
  int? id;
  String? scientificName;
  String? popularName;
  String? description;

  List<CropEntity>? cropsAffected;
  List<ControlMethodEntity>? controlMethods;

  PestEntity({
    this.id,
    this.scientificName,
    this.popularName,
    this.description,
    this.cropsAffected,
    this.controlMethods,
  });

  factory PestEntity.fromJson(Map<String, dynamic> json) => PestEntity(
        id: json["id"] as int?,
        scientificName: json["scientific_name"] as String?,
        popularName: json["popular_name"] as String?,
        description: json["description"] as String?,
        cropsAffected: json["crops_affected"] != null
            ? (json["crops_affected"] as List<dynamic>?)
                ?.map((e) => CropEntity.fromJson(e))
                .toList()
            : null,
        controlMethods: json["control_methods"] != null
            ? (json["control_methods"] as List<dynamic>?)
                ?.map((e) => ControlMethodEntity.fromJson(e))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'scientific_name': scientificName,
        'popular_name': popularName,
        'description': description,
        'crops_affected': cropsAffected?.map((e) => e.toJson()).toList(),
        'control_methods': controlMethods?.map((e) => e.toJson()).toList(),
      }..removeWhere((key, value) => value == null);
}
