import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/ui/components/info_highlighted.dart';
import 'package:ai4d_pests_app/ui/components/text_linear_loading_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageClassificationBox extends GetView<ClassificationController> {
  final double? width;
  final double? height;

  const ImageClassificationBox({super.key, this.width, this.height});

  String get classificationConfidenceRateText {
    final prob = controller.classificationResponse?.resultProb;

    return prob == null
        ? "-"
        : prob >= 0.85
            ? "HIGH"
            : prob >= 0.65
                ? "MID"
                : "LOW";
  }

  String? get percentageConfidenceRateText {
    final prob = controller.classificationResponse?.resultProb;
    return prob != null ? "${prob.toStringAsFixed(2)}%" : "-";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Obx(
        () => Column(
          children: [
            if (controller.loadingManganer
                .isLoading(controller.pickImageFile.hashCode)) ...{
              const TextLinearProgressIndicator(
                text: 'Classificating Image',
              ),
            } else ...{
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoHighlightedText(
                    infoKey: 'Name',
                    infoValue: controller.classificationResponse?.resultLabel
                            ?.toUpperCase() ??
                        "-",
                  ),
                  Tooltip(
                    message: "Percentage = $percentageConfidenceRateText",
                    child: InfoHighlightedText(
                      infoKey: "Confidence",
                      infoValue: classificationConfidenceRateText,
                    ),
                  ),
                ],
              ),
            },
            const SizedBox(height: 5),
            controller.image?.toImageWidget(
                  width: width,
                  height: height != null ? height! - 37 : null,
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
