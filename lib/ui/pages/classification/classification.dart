import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/ui/components/big_button.dart';
import 'package:ai4d_pests_app/ui/components/rs2lab_title.dart';
import 'package:ai4d_pests_app/ui/components/text_linear_loading_bar_indicator.dart';
import 'package:ai4d_pests_app/ui/pages/classification/widgets/image_classification_box.dart';
import 'package:ai4d_pests_app/ui/pages/classification/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassificationPage extends GetView<ClassificationController> {
  final double contentWidth;

  const ClassificationPage({super.key, this.contentWidth = 500});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RS2LabTitleWidget(
          trailingSpans: [
            TextSpan(
              text: " - Pests Classification",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: contentWidth,
                  child: Obx(
                    () => controller.image == null
                        ? BigButton(
                            text: "Pick Image",
                            onClik: controller.pickImageFile,
                          )
                        : const ImageClassificationBox(
                            height: 400,
                          ),
                  ),
                ),
                SizedBox(
                  width: contentWidth,
                  child: Obx(
                    () => controller.loadingManganer.isLoading(
                            controller.getClassifiedPestInfo.hashCode)
                        ? const TextLinearProgressIndicator(
                            text: "Querying informations about the pest...",
                          )
                        : controller.classifiedPestEntity != null
                            ? InfoSection(
                                pest: controller.classifiedPestEntity!)
                            : Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
