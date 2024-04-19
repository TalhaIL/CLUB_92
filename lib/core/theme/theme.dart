import 'package:club_92/core/constants/color.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: const Color(0xff121212),
    surface: const Color(0xff222222),
    onBackground: const Color(0xffffffff),
    onSurface: const Color(0xffffffff),
    primary: appColor,
    onPrimary: const Color(0xffffffff),
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w800,
    ),
    titleSmall: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w200,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: Colors.white.withOpacity(0.3),
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Colors.white.withOpacity(0.7),
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    background: const Color(0xffffffff),
    surface: const Color(0xffECECEC),
    onBackground: const Color(0xff121212),
    onSurface: const Color(0xff121212),
    primary: appColor,
    onPrimary: const Color(0xffffffff),
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w200,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: Colors.black.withOpacity(0.5),
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Colors.black.withOpacity(0.7),
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
  ),
);
