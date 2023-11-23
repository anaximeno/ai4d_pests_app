import 'package:flutter/material.dart';

class MainBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double padding;
  final Color? borderColor;
  final Color? backgrounColor;
  final double borderWidth;
  final double borderRadius;
  final Widget child;

  const MainBox({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding = 10,
    this.borderWidth = 1,
    this.borderRadius = 5,
    this.borderColor,
    this.backgrounColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color:
              backgrounColor ?? Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(
            width: borderWidth,
            color: borderColor ?? Theme.of(context).colorScheme.primary,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
