import 'package:club_92/app_routes_import.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var devices = ["C50914FFA3EB94E9E9E0FE234E98AEA1"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  final storage = await SharedPreferences.getInstance();
  final isDark = storage.getBool('is_dark_theme') ?? true;
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Builder(
      builder: (context) {
        themeController.themeChange(isDark);
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Club 92',
            themeMode: themeController.theme.value,
            darkTheme: darkTheme,
            theme: lightTheme,
            initialRoute: '/login-screen',
            onGenerateRoute: generateRoutes,
          ),
        );
      },
    );
  }
}
