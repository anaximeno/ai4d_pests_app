import 'package:flutter/material.dart';

import 'rs2lab_title.dart';

class DefaultAppBar {
  final Key? key;

  final Widget? leading;

  final double? leadingWidth;

  final String? pageTitle;

  const DefaultAppBar({
    this.key,
    this.leading,
    this.leadingWidth,
    this.pageTitle,
  });

  AppBar build(BuildContext context) {
    return AppBar(
      key: key,
      leading: leading,
      leadingWidth: leadingWidth,
      title: RS2LabTitleWidget(
        trailingSpans: [
          if (pageTitle != null)
            TextSpan(
              text: " - $pageTitle",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
        ],
      ),
    );
  }
}
