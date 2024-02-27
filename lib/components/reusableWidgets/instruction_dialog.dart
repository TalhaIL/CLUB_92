import 'package:flutter/material.dart';

instructionDialog({required BuildContext context, title, content}) {
  Future.delayed(Duration.zero, () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          title: Text(title),
          content: Text(content),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      return;
    });
  });
}
