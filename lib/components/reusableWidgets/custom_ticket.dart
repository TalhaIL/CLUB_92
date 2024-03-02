import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTicket extends StatelessWidget {
  final String ticketAmount;
  const CustomTicket({
    super.key,
    required this.ticketAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 25,
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '\$$ticketAmount',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
