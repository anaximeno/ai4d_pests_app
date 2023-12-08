import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:ai4d_pests_app/ui/components/big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingWidth: 0,
        leading: Container(),
        pageTitle: "The University of Cape Verde",
      ).build(context),
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
            BigButton(
              text: "Informations",
              onClik: () => Get.toNamed(Routes.INFORMATIONS),
            ),
            const SizedBox(
              height: 20,
            ),
            BigButton(
              text: "About",
              onClik: () => Get.toNamed(Routes.ABOUT),
            ),
          ],
        ),
      ),
    );
  }
}
