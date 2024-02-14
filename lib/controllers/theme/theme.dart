import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.dark.obs;
  Rx<ThemeMode> get theme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme.value == ThemeMode.dark) {
      _currentTheme.value = ThemeMode.light;
    } else {
      _currentTheme.value = ThemeMode.dark;
    }
  }
}
