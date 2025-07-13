import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:workrhelp_flutter/components/abs_alert_dialog.dart';
import 'package:workrhelp_flutter/components/abs_button_primary.dart';
import 'package:workrhelp_flutter/components/abs_passfield.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/components/abs_textfield.dart';
import 'package:workrhelp_flutter/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> accountType = ["Individual", "Business"];
  int pageIndex = 0;
  String selectedIndividual = "";
  String selectedGender = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyController = TextEditingController();
  DateTime? selectedDob;
  final authController = EmailAuthController(client.modules.auth);
  // ignore: prefer_typing_uninitialized_variables
  var check;
  File? _selectedImage;
  bool isProvided = true;

  bool checkIfFieldsEmpty() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Widget choiceContainer(String imageAsset, String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4), // Position of the shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(imageAsset, height: 130, width: 130),
            const SizedBox(height: 20),
            AbsText(
              text: text,
              fontSize: 22,
            ),
          ],
        ),
      ),
    );
  }

  void pickAvatar() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        setState(() {
          _selectedImage = File(filePath);
        });
      }
    }
  }

  Future<String> uploadImage() async {
    if (_selectedImage != null) {
      var bytes = await _selectedImage!.readAsBytes();
      ByteData byteData = ByteData.view(bytes.buffer);
      var imageUrl = await client.misc
          .uploadImage(byteData, "uploads/avatar_${DateTime.now()}.png");
      return imageUrl;
    }
    return "";
  }

  Widget buildPage() {
    if (pageIndex == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          choiceContainer("assets/user_male.png", "User", () {
            setState(() {
              pageIndex = 1;
              selectedIndividual = "user";
            });
          }),
          choiceContainer("assets/helper_male.png", "Helper", () {
            setState(() {
              pageIndex = 1;
              selectedIndividual = "helper";
            });
          })
        ],
      );
    } else if (pageIndex == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              choiceContainer("assets/${selectedIndividual}_male.png", "Male",
                  () {
                setState(() {
                  selectedGender = "male";
                  pageIndex = 2;
                });
              }),
              choiceContainer(
                  "assets/${selectedIndividual}_female.png", "Female", () {
                setState(() {
                  selectedGender = "female";
                  pageIndex = 2;
                });
              })
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                  selectedIndividual = "";
                });
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ],
      );
    } else if (pageIndex == 2) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null) ...[
              GestureDetector(
                onTap: pickAvatar,
                child: Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: CircleAvatar(
                        radius: 50, child: Image.file(_selectedImage!)),
                  ),
                ),
              )
            ] else ...[
              choiceContainer(
                  "assets/${selectedIndividual}_$selectedGender.png",
                  "Select Avatar",
                  pickAvatar)
            ],
          ],
        ),
        const SizedBox(height: 20),
        AbsTextfield(hintText: "Name", controller: nameController),
        const SizedBox(height: 10),
        AbsTextfield(hintText: "email", controller: emailController),
        const SizedBox(height: 10),
        AbsTextfield(hintText: "contact", controller: contactController),
        const SizedBox(height: 10),
        AbsPassfield(hintText: "password", controller: passwordController),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                    selectedGender = "";
                  });
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const Spacer(),
            AbsButtonPrimary(
                onPressed: () async {
                  if (checkIfFieldsEmpty()) {
                    check = await authController.createAccountRequest(
                        nameController.text,
                        emailController.text,
                        passwordController.text);
                    if (check) {
                      showDialog(
                          barrierDismissible: false,
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                  title: const AbsText(
                                      text: "Verification Code", fontSize: 16),
                                  content: Card(
                                      child: AbsTextfield(
                                          hintText: "********",
                                          controller: verifyController)),
                                  actions: [
                                    AbsButtonPrimary(
                                      // Submit button when asking for
                                      // verification code
                                      onPressed: () async {
                                        // Attempt account validation
                                        check = await authController
                                            .validateAccount(
                                                emailController.text,
                                                verifyController.text);
                                        isProvided = true;
                                        // If validation is successful, account is created
                                        if (check != null) {
                                          var signInId =
                                              await authController.signIn(
                                                  emailController.text,
                                                  passwordController.text);
                                          var url = await uploadImage();
                                          // Need to update to redirect to setup profile pages
                                          var createdAccount = await client
                                              .account
                                              .createAccount(
                                                  signInId!.id!,
                                                  nameController.text,
                                                  selectedDob,
                                                  selectedGender,
                                                  url,
                                                  int.parse(
                                                      contactController.text),
                                                  selectedIndividual);
                                          if (createdAccount == -1) {
                                            showDialog(
                                                // ignore: use_build_context_synchronously
                                                context: context,
                                                builder: (context) =>
                                                    const AbsAlertDialog(
                                                      alert:
                                                          "Error Creating Account",
                                                    ));
                                          } else {
                                            Navigator.pushNamed(
                                                context, "/home");
                                          }
                                        }
                                        // If validation is not successful, show
                                        // invalid code popup
                                        else {
                                          showDialog(
                                              // ignore: use_build_context_synchronously
                                              context: context,
                                              builder: (context) =>
                                                  const AbsAlertDialog(
                                                    alert:
                                                        "Invalid Verification Code",
                                                  ));
                                        }
                                      },
                                      text: "Submit", fontSize: 14,
                                    )
                                  ]));
                    }
                  }
                },
                text: "Create Account")
          ],
        ),
      ]);
    }
    return Center(child: AbsText(text: "Error Finding Page!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true, // Important!
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            // This makes the screen scrollable when keyboard is open
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AbsText(
                  text: "Sign Up",
                  headColor: true,
                  bold: true,
                  fontSize: 32,
                ),
                const SizedBox(height: 20),
                buildPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
