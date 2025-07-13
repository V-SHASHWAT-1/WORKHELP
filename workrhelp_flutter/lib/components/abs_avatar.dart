import 'package:flutter/material.dart';
import 'package:workrhelp_client/workrhelp_client.dart';

class AbsAvatar extends StatelessWidget {
  final double radius;
  final User user;

  const AbsAvatar({
    super.key,
    required this.radius,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (user.avatar.isNotEmpty) {
      final uri = Uri.parse(user.avatar);
      imageProvider = NetworkImage(uri.toString());
    } else {
      imageProvider =
          AssetImage("assets/${user.accountType}_${user.gender}.png");
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: imageProvider,
        ),
      ],
    );
  }
}
