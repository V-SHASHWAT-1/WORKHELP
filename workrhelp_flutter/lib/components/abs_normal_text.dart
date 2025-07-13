import 'package:flutter/material.dart';

class AbsNormalText extends StatelessWidget {
  final String displayString;
  final double fontSize;
  final bool headColor;
  const AbsNormalText(
      {super.key,
      required this.displayString,
      required this.fontSize,
      this.headColor = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayString,
      style: TextStyle(
          fontSize: fontSize, color: headColor ? Colors.blue : Colors.black),
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
