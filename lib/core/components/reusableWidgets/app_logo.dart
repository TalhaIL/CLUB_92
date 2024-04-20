import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/voice-square.png",
          height: 70,
          width: 70,
          color: Theme.of(context).colorScheme.primary,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
