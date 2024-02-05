import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class CircularCountdownTimer extends StatelessWidget {
  const CircularCountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      ringColor: transparentWhite,
      duration: 3,
      width: 70,
      height: 70,
      fillColor: appColor,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      onComplete: () {
        // Handle completion if needed
      },
      textStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.white.withOpacity(0.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
