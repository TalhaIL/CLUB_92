import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final double? width;
  final double? height;
  final bool isSearch;
  const CustomMaterialButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.isSearch = false,
      this.width = 150,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        side: isSearch
            ? const BorderSide(
                color: Color.fromRGBO(27, 94, 32, 1),
                width: 3,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      color: greenColor,
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
