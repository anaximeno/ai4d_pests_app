import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ai4d_pests_app/ui/pages/pages.dart';

void main() {
  return runApp(
    GetMaterialApp(
      title: "RS2Lab - Pests App",
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
          page: () => const ClassificationPage(),
        ),
        GetPage(
          name: Routes.INFORMATIONS,
          page: () => const InformationPage(),
        ),
      ],
    ),
  );
}
