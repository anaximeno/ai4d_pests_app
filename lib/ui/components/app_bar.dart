import 'package:ai4d_pests_app/constants/text_constants.dart';
import 'package:flutter/material.dart';

class PestsAppBar extends AppBar {
  PestsAppBar({
    super.key,
    String title = "${TextConstants.RS2LAB} - Pests App",
    super.leading,
    super.leadingWidth,
  }) : super(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
}
