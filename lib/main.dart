import 'dart:developer';

import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = GetStorage();
  final isDark = storage.read('is_dark_theme') ?? true;
  log(isDark.toString());
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});

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
            themeMode: controller.theme,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: appColor,
                useMaterial3: true,
                colorScheme: ColorScheme.dark(
                    brightness: Brightness.dark,
                    background: const Color(0xff20283b).withOpacity(1),
                    tertiary: Colors.white,
                    primaryContainer: transparentWhite),
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
                  tertiary: Colors.black,
                  primaryContainer: Colors.white),
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
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
