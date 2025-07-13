import 'package:flutter/material.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';

class AbsButtonPrimary extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double fontSize;
  const AbsButtonPrimary(
      {super.key,
      required this.onPressed,
      required this.text,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      child: AbsText(text: text, fontSize: fontSize),
    );
  }
}
