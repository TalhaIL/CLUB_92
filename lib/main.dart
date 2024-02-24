import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/screens/auth/login/login_screen.dart';
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
              // primaryTextTheme: TextTheme(
              //   bodyLarge: const TextStyle(color: Colors.white),
              //   bodyMedium: const TextStyle(color: Colors.white),
              //   bodySmall: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: Colors.white.withOpacity(0.5),
              //   ),
              // ),
            ),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.light(
                brightness: Brightness.light,
                background: const Color(0xffffffff),
                surface: const Color(0xffffffff),
                onBackground: const Color(0xff121212),
                onSurface: const Color(0xff121212),
                primary: appColor,
                onPrimary: const Color(0xffffffff),
              ),
              // primaryTextTheme: TextTheme(
              //   bodyLarge: const TextStyle(color: Colors.black),
              //   bodyMedium: const TextStyle(color: Colors.black),
              //   bodySmall: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black.withOpacity(0.5),
              //   ),
              // ),
            ),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
