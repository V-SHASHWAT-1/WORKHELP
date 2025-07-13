import 'package:flutter/material.dart';

class AbsPassfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const AbsPassfield({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<AbsPassfield> createState() => _AbsTextfieldState();
}

class _AbsTextfieldState extends State<AbsPassfield> {
  bool _visible = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
        onTap: () {
          setState(() {
            isActive = true;
          });
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: isActive ? Colors.blue : Colors.black, width: 2),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              icon: Icon(
                _visible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            )),
        obscureText: !_visible,
        onChanged: (val) {
          setState(() {
            widget.controller.text = val;
          });
        });
  }
}
