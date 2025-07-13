import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_normal_text.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/pages/request_desc_page.dart';

class AbsRequestBox extends StatelessWidget {
  final Requests requestData;
  final int userId;
  const AbsRequestBox(
      {super.key, required this.requestData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.grey[200],
      shadowColor: Colors.black45,
      borderRadius: BorderRadius.circular(14),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RequestDescPage(
                      requestData: requestData, mainUserId: userId)));
        },
        child: Container(
          width: 150,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AbsText(text: requestData.description, fontSize: 22),
              Row(
                children: [
                  AbsText(
                    text: "Status: ",
                    fontSize: 16,
                  ),
                  AbsText(
                    text: requestData.status,
                    fontSize: 16,
                    headColor: true,
                  )
                ],
              ),
              AbsNormalText(
                  displayString:
                      "made at: ${requestData.madeAt.hour}:${requestData.madeAt.minute}",
                  fontSize: 16),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
