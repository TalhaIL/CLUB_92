import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isReadOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? isEnabled;
  final IconButton? icon;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isEnabled,
      this.isReadOnly = false,
      this.maxLines,
      this.controller,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          enabled: isEnabled,
          maxLines: maxLines,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            border: InputBorder.none,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
