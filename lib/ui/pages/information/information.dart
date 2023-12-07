import 'package:ai4d_pests_app/domain/controllers/information.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends GetView<InformationController> {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        pageTitle: "Pests Information",
      ).build(context),
    );
  }
}
