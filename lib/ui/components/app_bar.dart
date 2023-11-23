import 'package:flutter/material.dart';

class PestsAppBar extends AppBar {
  PestsAppBar({
    super.key,
    String title = "RS2Lab - Pests App",
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
