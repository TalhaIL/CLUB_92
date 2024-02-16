import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/speakers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: Colors.white,
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
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    children: [
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
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: deepPurple,
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
                  child: const Text('Next'),
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
