import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';

class AbsAlertDialog extends StatefulWidget {
  final String alert;
  const AbsAlertDialog({super.key, required this.alert});

  @override
  State<AbsAlertDialog> createState() => _AbsAlertDialogState();
}

class _AbsAlertDialogState extends State<AbsAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
          constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(height: 20),
            AbsText(
              text: widget.alert,
              fontSize: 16,
            )
          ])),
    );
  }
}
