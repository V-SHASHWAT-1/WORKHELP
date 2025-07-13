import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_avatar.dart';
import 'package:workrhelp_flutter/components/abs_bottom_nav.dart';
import 'package:workrhelp_flutter/components/abs_button_secondary.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/main.dart';
import 'package:workrhelp_flutter/pages/landing_page.dart';
import 'package:workrhelp_flutter/pages/login_page.dart';
import 'package:workrhelp_flutter/pages/track_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  late User userData;
  bool isLoading = true;

  void getAccountData() async {
    var accountObj =
        await client.account.fetchAccount(sessionManager.signedInUser!.id!);
    setState(() {
      userData = accountObj!;
      isLoading = false;
    });
  }

  void navigateBottomBar(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    getAccountData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> pages = isLoading
        ? [
            Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            )),
            Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          ]
        : [LandingPage(userData: userData), const TrackPage()];
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isLoading
                ? []
                : [
                    const SizedBox(height: 45),
                    AbsAvatar(radius: 40, user: userData),
                    const SizedBox(height: 10),
                    AbsText(
                        text: userData.name,
                        fontSize: 22,
                        bold: true,
                        headColor: true),
                    AbsText(text: userData.accountType, fontSize: 18),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                            child: AbsButtonSecondary(
                                onPressed: () async {
                                  Navigator.pushAndRemoveUntil(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                      (Route<dynamic> route) => true);
                                  await sessionManager.signOutDevice();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 12),
                                    const AbsText(
                                      text: "Sign Out",
                                      fontSize: 22,
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
          ),
        ),
      ),
      body: pages[selectedPageIndex],
      bottomNavigationBar:
          AbsBottomNav(onTabChange: (index) => navigateBottomBar(index)),
    );
  }
}
