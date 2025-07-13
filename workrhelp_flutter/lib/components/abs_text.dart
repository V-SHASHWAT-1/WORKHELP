import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbsText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool headColor;
  final bool bold;
  const AbsText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.headColor = false,
      this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.baumans(
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: headColor ? Colors.blue : Colors.black,
      ),
    );
  }
}
