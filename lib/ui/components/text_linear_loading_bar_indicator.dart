import 'package:flutter/material.dart';

class TextLinearProgressIndicator extends StatelessWidget {
  final String text;

  const TextLinearProgressIndicator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      children: [
        Text(text, style: textStyle),
        const LinearProgressIndicator(),
      ],
    );
  }
}
