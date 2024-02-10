import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Club 92',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: appColor,
        useMaterial3: true,
        primaryTextTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: Colors.white), // White text for dark theme
          bodyMedium:
              TextStyle(color: Colors.white), // White text for dark theme
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        primaryTextTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: Colors.black), // Black text for light theme
          bodyMedium:
              TextStyle(color: Colors.black), // Black text for light theme
        ),
      ),
      home: const ChooseCountry(),
    );
  }
}
