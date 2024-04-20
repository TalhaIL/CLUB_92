import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.dark.obs;
  Rx<ThemeMode> get theme => _currentTheme;

  themeChange(bool isDark) {
    if (isDark) {
      _currentTheme.value = ThemeMode.dark;
    } else {
      _currentTheme.value = ThemeMode.light;
    }
    return;
  }

  void toggleTheme(val) async {
    final storage = await SharedPreferences.getInstance();
    if (val) {
      _currentTheme.value = ThemeMode.dark;
      storage.setBool('is_dark_theme', true);
    } else {
      _currentTheme.value = ThemeMode.light;
      storage.setBool('is_dark_theme', false);
    }
  }
}
