import 'package:flutter/material.dart';

class RS2LabTitleWidget extends StatelessWidget {
  final List<TextSpan>? trailingSpans;

  const RS2LabTitleWidget({super.key, this.trailingSpans});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "RS\u00b2",
        style: Theme.of(context)
            .appBarTheme
            .titleTextStyle
            ?.copyWith(color: const Color(0xffab162b)),
        children: <TextSpan>[
          TextSpan(
            text: "LAB",
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(color: const Color(0xff808284)),
          ),
          if (trailingSpans?.isNotEmpty == true) ...?trailingSpans,
        ],
      ),
    );
  }
}
