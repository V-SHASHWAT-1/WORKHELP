import 'package:flutter/material.dart';

class AbsMultilineTextfield extends StatefulWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final bool border;

  const AbsMultilineTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 4,
    this.border = false,
  });

  @override
  State<AbsMultilineTextfield> createState() => _AbsMultilineTextfieldState();
}

class _AbsMultilineTextfieldState extends State<AbsMultilineTextfield> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      minLines: 1,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      onTap: () {
        setState(() {
          isActive = true;
        });
      },
      style: TextStyle(
        fontSize: 16,
        color: theme.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: widget.border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )
            : InputBorder.none,
        focusedBorder: widget.border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: isActive ? Colors.blue : Colors.black, width: 2),
              )
            : InputBorder.none,
      ),
    );
  }
}
