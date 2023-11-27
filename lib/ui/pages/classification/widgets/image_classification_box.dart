import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/ui/components/text_linear_loading_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageClassificationBox extends GetView<ClassificationController> {
  final double? width;
  final double? height;

  const ImageClassificationBox({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Obx(
        () => Column(
          children: [
            if (controller.classificationResponse == null) ...{
              const TextLinearProgressIndicator(
                text: 'Classificating Image',
              ),
            } else ...{
              RichText(
                text: TextSpan(
                  text: 'Scientific Name: ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: controller
                              .classificationResponse?.output?.result?.label
                              ?.toUpperCase() ??
                          "-",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            },
            const SizedBox(height: 5),
            controller.image?.toImageWidget(
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ) ??
                SizedBox(
                  width: width,
                  height: height,
                  child: const Text(
                    'Image not Available for Display!',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
