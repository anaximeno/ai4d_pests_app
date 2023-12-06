import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:ai4d_pests_app/ui/components/big_button.dart';
import 'package:ai4d_pests_app/ui/components/rs2lab_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RS2LabTitleWidget(
          trailingSpans: [
            TextSpan(
              text: " - Pests App",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigButton(
              text: "Classification",
              onClik: () => Get.toNamed(Routes.CLASSIFICATION),
            ),
            const SizedBox(
              height: 20,
            ),
            // BigButton(
            //   text: "Informations",
            //   onClik: () => Get.toNamed(Routes.INFORMATIONS),
            // ),
          ],
        ),
      ),
    );
  }
}
