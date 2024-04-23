import 'package:club_92/controllers/theme/theme.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/screens/settings/community_guidelines_screen.dart';
import 'package:club_92/screens/settings/faqs_screen.dart';
import 'package:club_92/screens/auth/register/interests.dart';
import 'package:club_92/screens/settings/privacy_policy_screen.dart';
import 'package:club_92/screens/settings/terms_conditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSwitchTile(
                    icon: Icons.notifications_off,
                    color: red.withOpacity(0.1),
                    iconColor: red,
                    text: 'Pause Notifications',
                    switchValue: isPausedNotification,
                    onChanged: (val) =>
                        setState(() => isPausedNotification = val),
                  ),
                  Obx(
                    () => _buildSwitchTile(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      icon: Icons.dark_mode_outlined,
                      iconColor: Theme.of(context).colorScheme.primary,
                      text: 'Dark Mode',
                      switchValue: controller.theme.value == ThemeMode.dark,
                      onChanged: controller.toggleTheme,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const SettingsDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildMethodTile(
                icon: Icons.interests_outlined,
                color: brown.withOpacity(0.1),
                iconColor: brown,
                text: 'Interests',
                onTap: () =>
                    Get.toNamed(UsersInterestScreen.route, arguments: true),
              ),
            ),
            const SizedBox(height: 5),
            const SettingsDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMethodTile(
                      color: green.withOpacity(0.1),
                      iconColor: green,
                      icon: CupertinoIcons.question,
                      text: 'FAQs',
                      onTap: () => Get.toNamed(FaqsScreen.route)),
                  _buildMethodTile(
                    color: indigo.withOpacity(0.1),
                    iconColor: indigo,
                    icon: Icons.rule_sharp,
                    text: 'Terms and Conditions',
                    onTap: () => Get.toNamed(TermsConditionsScreen.route),
                  ),
                  _buildMethodTile(
                    color: teal.withOpacity(0.1),
                    iconColor: teal,
                    icon: CupertinoIcons.pen,
                    text: 'Community Guidelines',
                    onTap: () => Get.toNamed(CommunityGuidelines.route),
                  ),
                  _buildMethodTile(
                    color: orange.withOpacity(0.1),
                    iconColor: orange,
                    icon: Icons.privacy_tip_outlined,
                    text: 'Privacy Policy',
                    onTap: () => Get.toNamed(PrivacyPolicyScreen.route),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const SettingsDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildMethodTile(
                color: redAccent.withOpacity(0.1),
                iconColor: redAccent,
                icon: Icons.logout,
                text: 'logout',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 5),
            const SettingsDivider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required Color color,
    required Color iconColor,
    required IconData icon,
    required String text,
    required bool switchValue,
    required Function(bool) onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        Transform.scale(
          scale: 0.85,
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: switchValue,
            inactiveThumbColor: Colors.black26,
            trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.transparent;
              }
              return Colors.black26;
            }),
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        )
      ],
    );
  }

  Widget _buildMethodTile({
    required Color color,
    required IconData icon,
    required Color iconColor,
    required String text,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      color: Theme.of(context).colorScheme.surface,
      thickness: 8,
    );
  }
}
