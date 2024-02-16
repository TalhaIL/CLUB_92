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
        color: deepPurple,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Center(
            child: Text(
              '\$$ticketAmount',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }
}
