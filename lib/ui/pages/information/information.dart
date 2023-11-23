import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PestsAppBar(
        title: "RS2Lab - Pests Information",
      ),
    );
  }
}
