import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends GetView {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        pageTitle: "About",
      ).build(context),
    );
  }
}
