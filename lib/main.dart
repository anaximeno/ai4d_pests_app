import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:ai4d_pests_app/infra/di.dart';
import 'package:ai4d_pests_app/infra/env.dart';
import 'package:ai4d_pests_app/ui/style/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ai4d_pests_app/ui/pages/pages.dart';

import 'constants/text_constants.dart';

void main() {
  DI.inject();

  return runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "${TextConstants.RS2LAB} - Pests App",
      theme: Theming.theme,
      home: const HomePage(),
      getPages: [
        GetPage(
          name: Routes.CLASSIFICATION,
          page: () => const ClassificationPage(),
        ),
        GetPage(
          name: Routes.INFORMATIONS,
          page: () => const InformationPage(),
        ),
      ],
      onReady: () {
        Env env = Get.find();
        env.loadConfigs();
      },
    ),
  );
}
