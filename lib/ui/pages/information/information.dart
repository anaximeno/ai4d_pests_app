import 'package:ai4d_pests_app/domain/controllers/information.dart';
import 'package:ai4d_pests_app/ui/components/rs2lab_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends GetView<InformationController> {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RS2LabTitleWidget(
          trailingSpans: [
            TextSpan(
              text: " - Pests Information",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
