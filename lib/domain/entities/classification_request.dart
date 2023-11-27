import 'package:ai4d_pests_app/domain/entities/image_file.dart';

class ClassificationRequestEntity {
  ImageFileEntity? image;

  ClassificationRequestEntity(this.image);

  Map<String, dynamic> toJson() => {
        "input": image?.toMultipartFile(),
        "type": "image",
      };
}
