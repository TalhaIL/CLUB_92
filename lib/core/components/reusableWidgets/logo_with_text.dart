import 'package:flutter/material.dart';

class LogowithText extends StatelessWidget {
  const LogowithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 80,
              width: 80,
              image: AssetImage('assets/images/voice-square.png'),
            ),
            Text(
              'Club 92',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
