import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:ai4d_pests_app/infra/di.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ai4d_pests_app/ui/pages/pages.dart';

import 'constants/text_constants.dart';

void main() {
  DI.inject();

  return runApp(
    GetMaterialApp(
      title: "${TextConstants.RS2LAB} - Pests App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffab162b),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(
          name: Routes.CLASSIFICATION,
          page: () => ClassificationPage(),
        ),
        GetPage(
          name: Routes.INFORMATIONS,
          page: () => const InformationPage(),
        ),
      ],
    ),
  );
}
