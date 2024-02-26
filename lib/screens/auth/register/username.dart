import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/auth/register/speakers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
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
                  height: 30,
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
                  height: 30,
                ),
                const CustomTextField(hintText: "What's your name"),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(hintText: 'Set a username'),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(hintText: 'Enter your email'),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(hintText: 'Choose your password'),
                const SizedBox(
                  height: 30,
                ),
                CustomMaterialButton(
                  onPress: () {
                    Get.to(
                      () => const SpeakersScreen(),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
