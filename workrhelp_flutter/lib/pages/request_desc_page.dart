import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_avatar.dart';
import 'package:workrhelp_flutter/components/abs_button_primary.dart';
import 'package:workrhelp_flutter/components/abs_button_secondary.dart';
import 'package:workrhelp_flutter/components/abs_map.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/main.dart';

class RequestDescPage extends StatefulWidget {
  final Requests requestData;
  final int mainUserId;
  const RequestDescPage(
      {super.key, required this.requestData, required this.mainUserId});

  @override
  State<RequestDescPage> createState() => _RequestDescPageState();
}

class _RequestDescPageState extends State<RequestDescPage> {
  late User? userData;
  late User? mainUserData;
  bool isLoading = true;

  void getBuildData() async {
    var accountObj =
        await client.account.fetchAccount(widget.requestData.madeBy);
    var mainUser = await client.account.fetchAccount(widget.mainUserId);
    setState(() {
      userData = accountObj!;
      mainUserData = mainUser;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getBuildData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isLoading
                ? [CircularProgressIndicator(color: Colors.blue)]
                : [
                    AbsText(
                        text: widget.requestData.description,
                        fontSize: 26,
                        headColor: true,
                        bold: true),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AbsText(text: "Raised By: ", bold: true, fontSize: 20),
                        const SizedBox(width: 10),
                        AbsAvatar(radius: 30, user: userData!),
                        const SizedBox(width: 10),
                        AbsText(text: userData!.name)
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (widget.requestData.images.isNotEmpty) ...[
                      AbsText(
                        text: "Photos",
                        fontSize: 20,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          height: 240,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.requestData.images.map((image) {
                                return Image.network(image,
                                    fit: BoxFit.contain);
                              }).toList(),
                            ),
                          )),
                      const SizedBox(height: 10),
                    ],
                    AbsText(text: "Location", fontSize: 20),
                    const SizedBox(height: 10),
                    AbsMap(location: widget.requestData.location),
                    const SizedBox(height: 12),
                    if (mainUserData!.accountType == "helper" &&
                        widget.requestData.status == "active") ...[
                      Row(
                        children: [
                          Expanded(
                              child: AbsButtonSecondary(
                                  onPressed: () {},
                                  child: AbsText(text: "Contact Asker"))),
                          const SizedBox(width: 20),
                          Expanded(
                              child: AbsButtonPrimary(
                                  onPressed: () {}, text: "Accept Request"))
                        ],
                      )
                    ] else ...[
                      if (mainUserData!.userInfoId == userData!.userInfoId) ...[
                        Row(
                          children: [
                            Expanded(
                                child: AbsButtonPrimary(
                              onPressed: () {},
                              text: "Cancel Request",
                              fontSize: 20,
                            ))
                          ],
                        )
                      ]
                    ]
                  ],
          ),
        )));
  }
}
