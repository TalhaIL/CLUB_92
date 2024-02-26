import 'dart:developer';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await SharedPreferences.getInstance();
  final isDark = storage.getBool('is_dark_theme') ?? true;
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
        controller.themeChange(isDark);
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
                )),
            theme: ThemeData(
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
                )),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
