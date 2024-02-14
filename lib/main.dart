import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/theme/theme.dart';
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
    return Builder(
      builder: (context) {
        final controller = Get.put(
          ThemeController(),
        );
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Club 92',
            themeMode: controller.theme.value,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: appColor,
                useMaterial3: true,
                colorScheme: ColorScheme.dark(
                  brightness: Brightness.dark,
                  background: const Color(0xff20283b).withOpacity(1),
                ),
                primaryTextTheme: const TextTheme(
                  bodyLarge: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: appColor,
                )),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              colorScheme: ColorScheme.light(
                brightness: Brightness.light,
                background: Colors.white.withOpacity(0.95),
              ),
              primaryTextTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
                bodyMedium: TextStyle(color: Colors.black),
              ),
            ),
            home: const ChooseCountry(),
          ),
        );
      },
    );
  }
}
