import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onPress;
  final Widget child;
  final double? width;
  final double? height;

  const CustomMaterialButton({
    super.key,
    required this.onPress,
    required this.child,
    this.width = 150,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: width,
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: greenColor,
        onPressed: onPress,
        child: child);
  }
}
