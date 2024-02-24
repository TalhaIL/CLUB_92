import 'package:club_92/components/reusableWidgets/language_bottom_sheet.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/screens/Settings/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isPausedNotification = false;
  bool isDarkMode = true;
  String isSelectedLanguage = 'English';
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWithSwitch(
                text: 'Pause Notifications',
                switchValue: isPausedNotification,
                onChanged: null),
            const SizedBox(
              height: 18,
            ),
            Obx(
              () => textWithSwitch(
                  text: 'Dark Mode',
                  switchValue: controller.theme.value == ThemeMode.dark,
                  onChanged: (val) {
                    controller.toggleTheme();
                  }),
            ),
            const SizedBox(
              height: 18,
            ),
            textWithSwitch(
                text: 'App Language', text2: 'English', onChanged: null),
            const SizedBox(
              height: 18,
            ),
            const Divider(),
            textWithMethod(
              text: 'Interests',
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(),
            textWithMethod(
                text: 'FAQs',
                onTap: () {
                  Get.to(
                    () => const FaqsScreen(),
                  );
                }),
            textWithMethod(
              text: 'Terms and Conditions',
            ),
            textWithMethod(
              text: 'Community Guidelines',
            ),
            textWithMethod(
              text: 'Privacy Policy',
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(),
            textWithMethod(
              text: 'logout',
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }

  Column textWithMethod({required String text, Function()? onTap}) {
    return Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ),
      ],
    );
  }

  Row textWithSwitch({
    required String text,
    String? text2,
    bool? switchValue,
    required Function(bool)? onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 19,
          ),
        ),
        switchValue != null
            ? Switch(
                value: switchValue,
                onChanged: onChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              )
            : TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const LanguageBottomSheet();
                      });
                },
                child: Text(
                  text2.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
      ],
    );
  }
}
