import 'package:flutter/material.dart';

class BasicAlertDialog extends StatelessWidget {
  final String title;

  final String description;

  final VoidCallback? onOk;

  final VoidCallback? onCancel;

  const BasicAlertDialog({
    super.key,
    required this.title,
    required this.description,
    this.onOk,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        if (onCancel != null)
          TextButton(
            onPressed: onCancel,
            child: const Text('Cancel'),
          ),
        if (onOk != null)
          TextButton(
            onPressed: onOk,
            child: const Text('OK'),
          ),
      ],
    );
  }
}
