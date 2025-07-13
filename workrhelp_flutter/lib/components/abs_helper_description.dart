import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_avatar.dart';
import 'package:workrhelp_flutter/components/abs_normal_text.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';

class AbsHelperDescription extends StatefulWidget {
  final User helperData;
  const AbsHelperDescription({super.key, required this.helperData});

  @override
  State<AbsHelperDescription> createState() => _AbsHelperDescriptionState();
}

class _AbsHelperDescriptionState extends State<AbsHelperDescription> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 8,
        color: Colors.grey[200],
        shadowColor: Colors.black45,
        borderRadius: BorderRadius.circular(14),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AbsAvatar(radius: 35, user: widget.helperData),
                AbsText(
                    text: widget.helperData.name,
                    fontSize: 18,
                    headColor: true),
                if (widget.helperData.gender == "male") ...[
                  AbsNormalText(displayString: "(He/him)", fontSize: 14)
                ] else ...[
                  AbsNormalText(displayString: "(She/her)", fontSize: 14)
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow[800]),
                    AbsNormalText(displayString: "4.3", fontSize: 12)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
