// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class ThemeController extends GetxController {
//   final Rx<ThemeMode> _currentTheme = ThemeMode.dark.obs;
//   Rx<ThemeMode> get theme => _currentTheme;

//   themeChange(bool isDark) {
//     if (isDark) {
//       log('true....${isDark.toString()}');
//       _currentTheme.value = ThemeMode.dark;
//     } else {
//       log('false....${isDark.toString()}');

//       _currentTheme.value = ThemeMode.light;
//     }
//     return;
//   }

//   void toggleTheme() {
//     final storage = GetStorage();
//     if (_currentTheme.value == ThemeMode.dark) {
//       _currentTheme.value = ThemeMode.light;
//       storage.write('is_dark_theme', false);
//     } else {
//       _currentTheme.value = ThemeMode.dark;
//       storage.write('is_dark_theme', true);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;
  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;
  void changeTheme(bool val) => box.write('darkmode', val);
}
