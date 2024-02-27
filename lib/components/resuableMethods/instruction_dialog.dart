import 'package:club_92/components/reusableWidgets/alert_dialog.dart';
import 'package:flutter/material.dart';

instructionDialog({required BuildContext context, title, content}) {
  Future.delayed(const Duration(seconds: 1), () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title,
          content: content,
        );
      },
    );
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pop();
      return;
    });
  });
}
