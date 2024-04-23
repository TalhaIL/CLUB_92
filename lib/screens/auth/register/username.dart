import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/screens/auth/register/speakers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class AddUserDetailsScreen extends StatelessWidget {
  static const String route = '/username-screen';
  final bool isUpdate;
  const AddUserDetailsScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isUpdate == false
              ? TextButton(
                  onPressed: () {
                    Get.toNamed(ChooseSpeakersScreen.route);
                  },
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
        title: isUpdate
            ? const Text(
                'UPDATE YOUR DETAILS',
                style: TextStyle(fontSize: 15),
              )
            : const Text(
                'GIVE YOUR DETAILS',
                style: TextStyle(fontSize: 15),
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 70,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    children: const [
                      TextSpan(text: 'Great now let us know\n'),
                      TextSpan(text: 'how you look a like'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: 115,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: appColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(hintText: "What's your name"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(hintText: 'Set a username'),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(hintText: 'Enter your email'),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(hintText: 'Choose your password'),
                const SizedBox(
                  height: 10,
                ),
                isUpdate == false
                    ? CustomMaterialButton(
                        onPress: () {
                          Get.toNamed(ChooseSpeakersScreen.route);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ).animate().fade().scaleX(delay: 100.ms)
                    : CustomMaterialButton(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ).animate().fade().scaleX(delay: 100.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
