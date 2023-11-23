import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:ai4d_pests_app/ui/components/big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassificationPage extends GetView<ClassificationController> {
  const ClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PestsAppBar(
        title: "RS2Lab - Pests Classification",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigButton(
              text: "Pick File",
              onClik: controller.pickFile,
            ),
          ],
        ),
      ),
    );
  }
}
