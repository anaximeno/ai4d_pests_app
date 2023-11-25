import 'package:ai4d_pests_app/domain/entities/image_file.dart';

class ClassificaitonRequestEntity {
  ImageFileEntity? image;

  ClassificaitonRequestEntity(this.image);

  Map<String, dynamic> toJson() => {
        "input": image,
      };
}
