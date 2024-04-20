import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/screens/settings/community_guidelines_screen.dart';
import 'package:club_92/screens/settings/faqs_screen.dart';
import 'package:club_92/screens/auth/login/login_screen.dart';
import 'package:club_92/screens/auth/register/interests.dart';
import 'package:club_92/screens/settings/privacy_policy_screen.dart';
import 'package:club_92/screens/settings/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  static const String route = '/setting-screen';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isPausedNotification = false;
  final ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile(
              text: 'Pause Notifications',
              switchValue: isPausedNotification,
              onChanged: (val) => setState(() => isPausedNotification = val),
            ),
            Obx(() => _buildSwitchTile(
                  text: 'Dark Mode',
                  switchValue: controller.theme.value == ThemeMode.dark,
                  onChanged: controller.toggleTheme,
                )),
            const SizedBox(height: 5),
            const Divider(
              thickness: 0.2,
            ),
            _buildMethodTile(
              text: 'Interests',
              onTap: () =>
                  Get.toNamed(UsersInterestScreen.route, arguments: true),
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 0.2,
            ),
            _buildMethodTile(
                text: 'FAQs', onTap: () => Get.toNamed(FaqsScreen.route)),
            _buildMethodTile(
                text: 'Terms and Conditions',
                onTap: () => Get.toNamed(TermsConditionsScreen.route)),
            _buildMethodTile(
                text: 'Community Guidelines',
                onTap: () => Get.toNamed(CommunityGuidelines.route)),
            _buildMethodTile(
                text: 'Privacy Policy',
                onTap: () => Get.toNamed(PrivacyPolicyScreen.route)),
            const SizedBox(height: 5),
            const Divider(
              thickness: 0.2,
            ),
            _buildMethodTile(
                text: 'logout', onTap: () => Get.toNamed(LoginScreen.route)),
            const SizedBox(height: 5),
            const Divider(
              thickness: 0.2,
            ),
            const SizedBox(height: 10),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String text,
    required bool switchValue,
    required Function(bool) onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 19)),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  Widget _buildMethodTile({
    required String text,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: onTap,
          child: Text(text, style: const TextStyle(fontSize: 19)),
        ),
      ],
    );
  }
}
