import 'package:ai4d_pests_app/domain/entities/image_file.dart';
import 'package:ai4d_pests_app/ui/components/text_linear_loading_bar_indicator.dart';
import 'package:flutter/material.dart';

class ImageClassificationBox extends StatelessWidget {
  final ImageFileEntity image;

  final double? width;

  final double? height;

  const ImageClassificationBox({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          const TextLinearProgressIndicator(
            text: 'Classificating Image',
          ),
          const SizedBox(height: 5),
          image.toImageWidget(
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
