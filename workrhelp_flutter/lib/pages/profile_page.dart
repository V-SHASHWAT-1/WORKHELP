import 'package:flutter/material.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [AbsText(text: "Profile Page")],
    );
  }
}
