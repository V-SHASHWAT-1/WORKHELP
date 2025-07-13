import 'package:flutter/material.dart';

class AbsButtonSecondary extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double fontSize;
  const AbsButtonSecondary(
      {super.key,
      required this.onPressed,
      required this.child,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue;

    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: themeColor,
        side: BorderSide(width: 2, color: themeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Adjust based on the image
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(fontSize: fontSize),
      ),
      child: child,
    );
  }
}
