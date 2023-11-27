import 'package:ai4d_pests_app/constants/text_constants.dart';
import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:ai4d_pests_app/ui/components/big_button.dart';
import 'package:ai4d_pests_app/ui/components/text_linear_loading_bar_indicator.dart';
import 'package:ai4d_pests_app/ui/pages/classification/widgets/image_classification_box.dart';
import 'package:ai4d_pests_app/ui/pages/classification/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassificationPage extends GetView<ClassificationController> {
  final scrollController = ScrollController();

  ClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PestsAppBar(
        title: "${TextConstants.RS2LAB} - Pests Classification",
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.image == null
                      ? BigButton(
                          text: "Pick Image",
                          onClik: controller.pickImageFile,
                        )
                      : const ImageClassificationBox(
                          height: 400,
                        ),
                ),
                Obx(
                  () => controller.loadingManganer
                          .isLoading(controller.getClassifiedPestInfo.hashCode)
                      ? const TextLinearProgressIndicator(
                          text: "Querying informations about the pest...",
                        )
                      : controller.classifiedPestEntity != null
                          ? InfoSection(pest: controller.classifiedPestEntity!)
                          : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
