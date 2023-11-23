import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClik;

  const BigButton({super.key, required this.text, this.onClik});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClik,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
