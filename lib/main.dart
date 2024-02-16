import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/speaker.dart';
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
                    tertiary: Colors.white),
                primaryTextTheme: TextTheme(
                  bodyLarge: const TextStyle(color: Colors.white),
                  bodyMedium: const TextStyle(color: Colors.white),
                  bodySmall: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: appColor,
                )),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              colorScheme: const ColorScheme.light(
                  brightness: Brightness.light,
                  background: Colors.white,
                  tertiary: Colors.black),
              primaryTextTheme: TextTheme(
                bodyLarge: const TextStyle(color: Colors.black),
                bodyMedium: const TextStyle(color: Colors.black),
                bodySmall: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            home: const ChooseCountry(),
          ),
        );
      },
    );
  }
}
