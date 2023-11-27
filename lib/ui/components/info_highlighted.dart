import 'package:flutter/material.dart';

class InfoHighlightedText extends StatelessWidget {
  final String infoKey, infoValue;

  final TextStyle? keyStyle, valueStyle;

  final TextAlign textAlign;

  const InfoHighlightedText({
    super.key,
    required this.infoKey,
    this.keyStyle,
    required this.infoValue,
    this.valueStyle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: "$infoKey: ",
        style: keyStyle ?? Theme.of(context).textTheme.bodyLarge,
        children: <TextSpan>[
          TextSpan(
            text: infoValue,
            style: valueStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
