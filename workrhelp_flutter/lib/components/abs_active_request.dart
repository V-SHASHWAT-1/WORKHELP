import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_button_primary.dart';
import 'package:workrhelp_flutter/components/abs_map.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/pages/request_desc_page.dart';

class AbsActiveRequest extends StatefulWidget {
  final Requests requestData;
  final int mainUserId;
  const AbsActiveRequest(
      {super.key, required this.requestData, required this.mainUserId});

  @override
  State<AbsActiveRequest> createState() => _AbsActiveRequestState();
}

class _AbsActiveRequestState extends State<AbsActiveRequest> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.grey[700],
                    ))
              ],
            ),
            const SizedBox(height: 15),
            Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              AbsText(
                  text: widget.requestData.description,
                  fontSize: 24,
                  bold: true),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestDescPage(
                                requestData: widget.requestData,
                                mainUserId: widget.mainUserId)));
                  },
                  icon: Icon(Icons.arrow_outward_rounded,
                      color: Colors.blue, size: 24)),
            ]),
            const SizedBox(height: 10),
            Row(
              children: [
                AbsText(
                  text: "Status: ",
                  fontSize: 20,
                ),
                AbsText(
                  text: widget.requestData.status,
                  headColor: true,
                  fontSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 10),
            AbsMap(location: widget.requestData.location),
            Row(
              children: [
                Expanded(
                  child: AbsButtonPrimary(
                      onPressed: () {}, text: "Cancel Request", fontSize: 22),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
