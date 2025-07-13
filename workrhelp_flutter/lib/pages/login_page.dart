import 'package:flutter/material.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:workrhelp_flutter/components/abs_alert_dialog.dart';
import 'package:workrhelp_flutter/components/abs_button_primary.dart';
import 'package:workrhelp_flutter/components/abs_button_secondary.dart';
import 'package:workrhelp_flutter/components/abs_passfield.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/components/abs_textfield.dart';
import 'package:workrhelp_flutter/main.dart';
import 'package:workrhelp_flutter/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late UserInfo? logCheck;
  final authController = EmailAuthController(client.modules.auth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      // Background image
      Image.asset(
        'assets/doodle_background.png',
        fit: BoxFit.cover,
      ),
      Center(
          child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(width: 2, color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AbsText(
                          text: "Workr",
                          headColor: true,
                          fontSize: 26,
                        ),
                        AbsText(
                          text: "Help",
                          fontSize: 26,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    AbsText(text: "L O G I N"),
                    const SizedBox(height: 10),
                    AbsTextfield(
                        hintText: "email", controller: emailController),
                    const SizedBox(height: 10),
                    AbsPassfield(
                        hintText: "password", controller: passwordController),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: AbsButtonPrimary(
                                onPressed: () async {
                                  // Both fields should be non-empty
                                  if (emailController.text != "" &&
                                      passwordController.text != "") {
                                    // Attempt sign in with the given credentials
                                    logCheck = await authController.signIn(
                                        emailController.text,
                                        passwordController.text);
                                    // If attempts returns a value, then account exists
                                    // redirect the user to home page
                                    if (logCheck != null) {
                                      // One way route to ensure user cannot come back to login page
                                      // unless they log out
                                      Navigator.pushAndRemoveUntil(
                                          // ignore: use_build_context_synchronously
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                          (Route<dynamic> route) => true);
                                    }
                                    // If account doesn't exist, return wrong credentials popup
                                    else {
                                      showDialog(
                                          // ignore: use_build_context_synchronously
                                          context: context,
                                          builder: (context) =>
                                              const AbsAlertDialog(
                                                  alert:
                                                      "Incorrect password or e-mail"));
                                    }
                                  }
                                  // If at least one field is empty, return popup
                                  // requiring both credentials
                                  else {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const AbsAlertDialog(
                                              alert:
                                                  "Both e-mail and password must be provided!",
                                            ));
                                  }
                                },
                                text: "LOGIN")),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AbsText(text: " O R ", fontSize: 16),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: AbsButtonSecondary(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: AbsText(text: "Sign Up", fontSize: 18)),
                        )
                      ],
                    )
                  ],
                ),
              )))
    ]));
  }
}
