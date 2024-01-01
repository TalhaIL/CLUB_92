import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isReadOnly;
  final bool? isEnabled;
  final IconButton? icon;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isEnabled,
      this.isReadOnly = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: textFieldColor,
        border: Border.all(
          color: Colors.blueGrey.withOpacity(
            0.2,
          ),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          enabled: isEnabled,
          readOnly: isReadOnly,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
            border: InputBorder.none,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
