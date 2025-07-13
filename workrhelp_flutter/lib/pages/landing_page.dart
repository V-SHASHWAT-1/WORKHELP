import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_active_request.dart';
import 'package:workrhelp_flutter/components/abs_helper_description.dart';
import 'package:workrhelp_flutter/components/abs_request_box.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/main.dart';

class LandingPage extends StatefulWidget {
  final User userData;
  const LandingPage({super.key, required this.userData});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Requests> activeRequests = [];
  List<User> helpers = [];
  List<Requests> nearbyRequests = [];
  bool isLoading = true;

  void getBuildData() async {
    var active = await client.request
        .fetchActiveUserRequest(sessionManager.signedInUser!.id!);
    if (widget.userData.accountType == "helper") {
      var nearRequest = await client.request.fetchActiveRequest();
      var nearHelpers = await client.account.fetchHelpers();
      setState(() {
        activeRequests = active;
        nearbyRequests = nearRequest;
        helpers = nearHelpers;
        isLoading = false;
      });
    } else {
      var nearHelpers = await client.account.fetchHelpers();
      setState(() {
        activeRequests = active;
        helpers = nearHelpers;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getBuildData();
    super.initState();
  }

  Widget createRequest() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/create-request");
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // shadow color
                  blurRadius: 10, // softening the shadow
                  spreadRadius: 2, // how much the shadow spreads
                  offset: Offset(4, 4), // position of the shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  "What do you need help with?",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mic, size: 32, color: Colors.black))
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          if (activeRequests.isNotEmpty) ...[
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.6, // adjust height
                          child: PageView(
                            children: activeRequests.map((request) {
                              return AbsActiveRequest(
                                requestData: request,
                                mainUserId: widget.userData.userInfoId,
                              );
                            }).toList(),
                          ),
                        );
                      });
                },
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // shadow color
                            blurRadius: 10, // softening the shadow
                            spreadRadius: 2, // how much the shadow spreads
                            offset: Offset(4, 4), // position of the shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AbsText(
                            text: "${activeRequests.length} Requests Active",
                            fontSize: 20,
                            bold: true,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ))),
            const SizedBox(height: 10)
          ],
          const SizedBox(height: 10),
          createRequest(),
          const SizedBox(height: 20),
          if (widget.userData.accountType == "helper") ...[
            const AbsText(
              text: "Offers Near You",
              fontSize: 22,
              bold: true,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < nearbyRequests.length; i++) ...[
                    AbsRequestBox(
                      requestData: nearbyRequests[i],
                      userId: widget.userData.userInfoId,
                    )
                  ]
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
          const AbsText(
            text: "Helpers Near You",
            fontSize: 22,
            bold: true,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < helpers.length; i++) ...[
                  AbsHelperDescription(helperData: helpers[i])
                ]
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
