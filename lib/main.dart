import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/choose_country.dart';
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
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Club 92',
      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        useMaterial3: true,
      ),
      home: const ChooseCountry(),
    );
  }
}
