import 'package:club_92/components/reusableWidgets/language_bottom_sheet.dart';
import 'package:club_92/constants/color.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
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
            ),
            const SizedBox(
              height: 18,
            ),
            textWithSwitch(
              text: 'Dark Mode',
              switchValue: isDarkMode,
            ),
            const SizedBox(
              height: 18,
            ),
            textWithSwitch(
              text: 'App Language',
              text2: 'English',
            ),
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
                color: Colors.white.withOpacity(0.5),
              ),
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
    bool? switchValue,
    String? text2,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        switchValue != null
            ? Switch(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    isPausedNotification = value;
                  });
                },
                activeColor: greenColor,
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
                      backgroundColor: Colors.black,
                      context: context,
                      builder: (BuildContext context) {
                        return const LanguageBottomSheet();
                      });
                },
                child: Text(
                  text2.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: greenColor,
                  ),
                ),
              )
      ],
    );
  }
}
