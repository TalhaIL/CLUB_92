import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogowithText extends StatelessWidget {
  const LogowithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcATop,
              ),
              child: Lottie.asset(
                'assets/animations/app_logo.json',
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Club 92',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
