import 'dart:developer';

import 'package:ai4d_pests_app/domain/controllers/information.dart';
import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:ai4d_pests_app/ui/pages/information/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPestInfo extends GetView<InformationController> {
  final double contentWidth;

  const ViewPestInfo({super.key, this.contentWidth = 500});

  @override
  Widget build(BuildContext context) {
    try {
      final pest = Get.arguments as PestEntity;
      return Scaffold(
        appBar: DefaultAppBar(
          pageTitle: pest.scientificName?.capitalize,
        ).build(context),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: context.width,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/pests/${pest.slug ?? ''}.jpg",
                    width: contentWidth,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: contentWidth,
                    child: InfoSection(
                      pest: pest,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      log("Couldn't access pest to show info!", error: e);
      Get.back();
      return const Placeholder();
    }
  }
}
